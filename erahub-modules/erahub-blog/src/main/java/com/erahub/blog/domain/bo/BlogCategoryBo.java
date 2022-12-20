package com.erahub.blog.domain.bo;

import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 博客分类业务对象
 *
 * @author erahub
 * @date 2022-12-20
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BlogCategoryBo extends BaseEntity {

    /**
     * 分类ID
     */
    @NotNull(message = "分类ID不能为空", groups = { EditGroup.class })
    private Long categoryId;

    /**
     * 分类名
     */
    @NotBlank(message = "分类名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String categoryName;

    /**
     * 分类状态（0正常 1停用）
     */
    @NotBlank(message = "分类状态（0正常 1停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 备注
     */
    private String remark;


}
