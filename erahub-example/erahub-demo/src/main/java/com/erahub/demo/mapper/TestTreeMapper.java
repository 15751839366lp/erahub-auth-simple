package com.erahub.demo.mapper;

import com.erahub.common.mybatis.annotation.DataColumn;
import com.erahub.common.mybatis.annotation.DataPermission;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.demo.domain.TestTree;
import com.erahub.demo.domain.vo.TestTreeVo;

/**
 * 测试树表Mapper接口
 *
 * @author erahub
 * @date 2021-07-26
 */
@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface TestTreeMapper extends BaseMapperPlus<TestTreeMapper, TestTree, TestTreeVo> {

}
