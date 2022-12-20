<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="标签ID" prop="tagId">
        <el-input
          v-model="queryParams.tagId"
          placeholder="请输入标签ID"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标签名" prop="tagName">
        <el-input
          v-model="queryParams.tagName"
          placeholder="请输入标签名"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标签状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择标签状态" clearable style="width: 200px">
          <el-option
            v-for="dict in blog_tag_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="发表时间" style="width: 308px">
        <el-date-picker
          v-model="daterangeCreateTime"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['blog:tag:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:tag:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:tag:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:tag:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tagList" @selection-change="handleSelectionChange" border>
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="标签ID" align="center" prop="tagId" v-if="true"/>
      <el-table-column label="标签名" align="center" prop="tagName" />
      <el-table-column label="标签状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="blog_tag_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="发表时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200" fixed="right">
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:tag:edit']"
          >修改</el-button>
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['blog:tag:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改博客标签对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="tagRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标签名" prop="tagName">
          <el-input v-model="form.tagName" placeholder="请输入标签名" />
        </el-form-item>
        <el-form-item label="标签状态">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in blog_tag_status"
              :key="dict.value"
:label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Tag">
import { listTag, getTag, delTag, addTag, updateTag } from "@/api/blog/tag";

const { proxy } = getCurrentInstance();
const { blog_tag_status } = proxy.useDict('blog_tag_status');

const tagList = ref([]);
const open = ref(false);
const buttonLoading = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const daterangeCreateTime = ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    tagId: undefined,
    tagName: undefined,
    status: undefined,
    createTime: undefined,
  },
  rules: {
    tagId: [
      { required: true, message: "标签ID不能为空", trigger: "blur" }
    ],
    tagName: [
      { required: true, message: "标签名不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "标签状态不能为空", trigger: "blur" }
    ],
    createTime: [
      { required: true, message: "发表时间不能为空", trigger: "blur" }
    ],
    remark: [
      { required: true, message: "备注不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询博客标签列表 */
function getList() {
  loading.value = true;
  queryParams.value.params = {};
  if (null != daterangeCreateTime && '' != daterangeCreateTime) {
    queryParams.value.params["beginCreateTime"] = daterangeCreateTime.value[0];
    queryParams.value.params["endCreateTime"] = daterangeCreateTime.value[1];
  }
  listTag(queryParams.value).then(response => {
    tagList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    tagId: null,
    tagName: null,
    status: "0",
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("tagRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeCreateTime.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.tagId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加博客标签";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset();
  const _tagId = row.tagId || ids.value
  getTag(_tagId).then(response => {
    loading.value = false;
    form.value = response.data;
    open.value = true;
    title.value = "修改博客标签";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["tagRef"].validate(valid => {
    if (valid) {
      buttonLoading.value = true;
      if (form.value.tagId != null) {
        updateTag(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).finally(() => {
          buttonLoading.value = false;
        });
      } else {
        addTag(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        }).finally(() => {
          buttonLoading.value = false;
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _tagIds = row.tagId || ids.value;
  proxy.$modal.confirm('是否确认删除博客标签编号为"' + _tagIds + '"的数据项？').then(function() {
    loading.value = true;
    return delTag(_tagIds);
  }).then(() => {
    loading.value = true;
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  }).finally(() => {
    loading.value = false;
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/tag/export', {
    ...queryParams.value
  }, `tag_${new Date().getTime()}.xlsx`)
}

getList();
</script>
