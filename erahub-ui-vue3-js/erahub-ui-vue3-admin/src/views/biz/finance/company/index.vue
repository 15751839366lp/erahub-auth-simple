<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="单位编号" prop="companyNumber">
        <el-input
          v-model="queryParams.companyNumber"
          placeholder="请输入单位编号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位名称" prop="companyName">
        <el-input
          v-model="queryParams.companyName"
          placeholder="请输入单位名称"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择单位状态" clearable style="width: 200px">
          <el-option
            v-for="dict in status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入创建者"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
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
          v-hasPermi="['biz:finance:company:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['biz:finance:company:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['biz:finance:company:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="Upload"
          @click="handleImport"
          v-hasPermi="['biz:finance:company:import']"
          >导入</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['biz:finance:company:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="financeCompanyList" @selection-change="handleSelectionChange" border>
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="单位ID" align="center" prop="companyId" v-if="false"/>
      <el-table-column label="单位编号" align="center" prop="companyNumber" />
      <el-table-column label="单位名称" align="center" prop="companyName" />
      <el-table-column label="单位状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="createBy" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200" fixed="right">
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:finance:company:edit']"
          >修改</el-button>
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:finance:company:remove']"
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

    <!-- 添加或修改单位管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="financeCompanyRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="单位编号" prop="companyNumber">
          <el-input v-model="form.companyNumber" placeholder="请输入单位编号" />
        </el-form-item>
        <el-form-item label="单位名称" prop="companyName">
          <el-input v-model="form.companyName" placeholder="请输入单位名称" />
        </el-form-item>
        <el-form-item label="单位状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in status"
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

     <!-- 单位数据导入对话框 -->
     <el-dialog :title="upload.title" v-model="upload.open" width="400px" append-to-body>
      <el-upload
        ref="uploadRef"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :on-error="handleFileError"
        :auto-upload="false"
        drag
      >
        <el-icon class="el-icon--upload"><upload-filled /></el-icon>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <template #tip>
          <div class="el-upload__tip text-center">
            <div class="el-upload__tip">
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在单位数据
            </div>
            <span>仅允许导入xls、xlsx格式文件。</span>
            <el-link
              type="primary"
              :underline="false"
              style="font-size: 12px; vertical-align: baseline"
              @click="importTemplate"
              >下载模板</el-link
            >
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitFileForm">确 定</el-button>
          <el-button @click="upload.open = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="FinanceCompany">
import { listFinanceCompany, getFinanceCompany, delFinanceCompany, addFinanceCompany, updateFinanceCompany } from "@/api/biz/finance/financeCompany";

import { getToken } from '@/utils/auth'

const { proxy } = getCurrentInstance();
const { status } = proxy.useDict('status');

const financeCompanyList = ref([]);
const open = ref(false);
const buttonLoading = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    companyNumber: undefined,
    companyName: undefined,
    status: undefined,
    createBy: undefined,
  },
  rules: {
    companyName: [
        { required: true, message: "单位名称不能为空", trigger: "blur" }
    ],
    status: [
        { required: true, message: "单位状态不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/*** 单位数据导入参数 */
const upload = reactive({
  // 是否显示弹出层（单位导入）
  open: false,
  // 弹出层标题（单位导入）
  title: '',
  // 是否禁用上传
  isUploading: false,
  // 是否更新已经存在的单位数据
  updateSupport: 0,
  // 设置上传的请求头部
  headers: { Authorization: 'Bearer ' + getToken() },
  // 上传的地址
  url: import.meta.env.VITE_APP_BASE_API + '/biz/finance/company/importData'
})

/** 查询单位管理列表 */
function getList() {
  loading.value = true;
  listFinanceCompany(queryParams.value).then(response => {
    financeCompanyList.value = response.rows;
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
    companyId: null,
    companyNumber: null,
    companyName: null,
    status: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("financeCompanyRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.companyId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加单位管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset();
  const _companyId = row.companyId || ids.value
  getFinanceCompany(_companyId).then(response => {
    loading.value = false;
    form.value = response.data;
    open.value = true;
    title.value = "修改单位管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["financeCompanyRef"].validate(valid => {
    if (valid) {
      buttonLoading.value = true;
      if (form.value.companyId != null) {
        updateFinanceCompany(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).finally(() => {
          buttonLoading.value = false;
        });
      } else {
        addFinanceCompany(form.value).then(response => {
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
  const _companyIds = row.companyId || ids.value;
  proxy.$modal.confirm('是否确认删除单位管理编号为"' + _companyIds + '"的数据项？').then(function() {
    loading.value = true;
    return delFinanceCompany(_companyIds);
  }).then(() => {
    loading.value = true;
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  }).finally(() => {
    loading.value = false;
  });
}

/** 导入按钮操作 */
function handleImport() {
  upload.title = '单位数据导入'
  upload.open = true
}
/** 下载模板操作 */
function importTemplate() {
  proxy.download('/biz/finance/company/importTemplate', {}, `financeCompany_template_${new Date().getTime()}.xlsx`)
}
/**文件上传中处理 */
const handleFileUploadProgress = (event, file, fileList) => {
  buttonLoading.value = true
  upload.isUploading = true
}
/** 文件上传成功处理 */
const handleFileSuccess = (response, file, fileList) => {
  upload.open = false
  upload.isUploading = false
  buttonLoading.value = false
  proxy.$refs['uploadRef'].handleRemove(file)
  console.log(proxy)
  proxy.$alert(
    "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
      response.msg +
      '</div>',
    '导入结果',
    { dangerouslyUseHTMLString: true }
  )
  getList()
}
/** 文件上传失败处理 */
const handleFileError = (response, file, fileList) => {

}
/** 提交上传文件 */
function submitFileForm() {
  proxy.$refs['uploadRef'].submit()
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('biz/finance/company/export', {
    ...queryParams.value
  }, `financeCompany_${new Date().getTime()}.xlsx`)
}

getList();
</script>
