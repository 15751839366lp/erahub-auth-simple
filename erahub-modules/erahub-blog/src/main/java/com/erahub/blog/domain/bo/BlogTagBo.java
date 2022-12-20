package com.erahub.blog.domain.bo;

import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 博客标签业务对象
 *
 * @author erahub
 * @date 2022-12-20
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BlogTagBo extends BaseEntity {

    /**
     * 标签ID
     */
    @NotNull(message = "标签ID不能为空", groups = { EditGroup.class })
    private Long tagId;

    /**
     * 标签名
     */
    @NotBlank(message = "标签名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String tagName;

    /**
     * 标签状态（0正常 1停用）
     */
    @NotBlank(message = "标签状态（0正常 1停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;


}
