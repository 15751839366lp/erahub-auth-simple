import { createApp } from 'vue'

import Cookies from 'js-cookie'

import ElementPlus from 'element-plus'
import locale from 'element-plus/lib/locale/lang/zh-cn' // 中文语言

// 引入全局样式
import '@/styles/index.scss'

import App from './App'
import store from './store'
import router from './router'
import directive from './directive' // directive

import 'virtual:windi.css'
import 'virtual:windi-devtools' // windicss

//引入编辑器
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'

// 注册指令
import plugins from './plugins' // plugins
import { download } from '@/utils/request'

// 图标
import 'virtual:svg-icons-register'
import Iconify from '@/components/Iconify'
import SvgIcon from '@/components/SvgIcon'
import elementIcons from '@/components/SvgIcon/svgicon'

// 高亮
import Highlight from '@/components/Highlight'

import './permission' // permission control

import { useDict } from '@/utils/dict'
import { getConfigKey, updateConfigByKey } from '@/api/system/config'
import {
  parseTime,
  resetForm,
  addDateRange,
  handleTree,
  selectDictLabel,
  selectDictLabels
} from '@/utils/erahub'

// 分页组件
import Pagination from '@/components/Pagination'
// 自定义表格工具组件
import RightToolbar from '@/components/RightToolbar'
// 文件上传组件
import FileUpload from '@/components/FileUpload'
// 图片上传组件
import ImageUpload from '@/components/ImageUpload'
// 图片预览组件
import ImagePreview from '@/components/ImagePreview'
// 自定义树选择组件
import TreeSelect from '@/components/TreeSelect'
// 字典标签组件
import DictTag from '@/components/DictTag'

const app = createApp(App)

// 全局方法挂载
app.config.globalProperties.useDict = useDict
app.config.globalProperties.getConfigKey = getConfigKey
app.config.globalProperties.updateConfigByKey = updateConfigByKey
app.config.globalProperties.download = download
app.config.globalProperties.parseTime = parseTime
app.config.globalProperties.resetForm = resetForm
app.config.globalProperties.handleTree = handleTree
app.config.globalProperties.addDateRange = addDateRange
app.config.globalProperties.selectDictLabel = selectDictLabel
app.config.globalProperties.selectDictLabels = selectDictLabels

// 全局组件挂载
app.component('DictTag', DictTag)
app.component('Pagination', Pagination)
app.component('TreeSelect', TreeSelect)
app.component('FileUpload', FileUpload)
app.component('ImageUpload', ImageUpload)
app.component('ImagePreview', ImagePreview)
app.component('RightToolbar', RightToolbar)

app.use(router)
app.use(store)
app.use(plugins)
app.use(elementIcons)
app.use(mavonEditor)
app.component('Iconify', Iconify)
app.component('SvgIcon', SvgIcon)
app.component('Highlight', Highlight)

directive(app)

// 使用element-plus 并且设置全局的大小
app.use(ElementPlus, {
  locale: locale,
  // 支持 large、default、small
  size: Cookies.get('size') || 'default'
})

// 修改 el-dialog 默认点击遮照为不关闭
app._context.components.ElDialog.props.closeOnClickModal.default = false

app.mount('#app')
