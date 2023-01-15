import { createApp } from 'vue'

import Cookies from 'js-cookie'

import ElementPlus from 'element-plus'
import locale from 'element-plus/lib/locale/lang/zh-cn' // 中文语言

import App from './App'
import store from './store'
import router from './router'

import 'virtual:windi.css'
import 'virtual:windi-devtools' // windicss

// 注册指令
import plugins from './plugins' // plugins
import { download } from '@/utils/request'

// 图标
import 'virtual:svg-icons-register'

const app = createApp(App)

// 全局方法挂载
app.config.globalProperties.download = download

app.use(router)
app.use(store)
app.use(plugins)
app.use(elementIcons)

// 使用element-plus 并且设置全局的大小
app.use(ElementPlus, {
  locale: locale,
  // 支持 large、default、small
  size: Cookies.get('size') || 'default'
})

// 修改 el-dialog 默认点击遮照为不关闭
app._context.components.ElDialog.props.closeOnClickModal.default = false

app.mount('#app')
