import path from 'path'
import { defineConfig, loadEnv } from "vite";
// import type { UserConfig, ConfigEnv } from 'vite'
import Vue from '@vitejs/plugin-vue'
import WindiCSS from 'vite-plugin-windicss'
import VueJsx from '@vitejs/plugin-vue-jsx'
import EslintPlugin from 'vite-plugin-eslint'
import VueI18n from '@intlify/vite-plugin-vue-i18n'
import { createStyleImportPlugin, ElementPlusResolve } from 'vite-plugin-style-import'
import { createSvgIconsPlugin } from 'vite-plugin-svg-icons'
import { createHtmlPlugin } from 'vite-plugin-html'
import viteCompression from 'vite-plugin-compression'
import VueMarcos from 'unplugin-vue-macros/vite'
import createVitePlugins from "./vite/plugins";

// 当前执行node命令时文件夹的地址（工作目录）
const root = process.cwd()

// 路径查找
function pathResolve(dir: string) {
  return path.resolve(root, '.', dir)
}

// https://vitejs.dev/config/
export default defineConfig(({ mode, command }) => {
    // const env = loadEnv(mode, process.cwd());
    let env = {} as any
    const isBuild = command === 'build'
    if (!isBuild) {
        env = loadEnv((process.argv[3] === '--mode' ? process.argv[4] : process.argv[3]), root)
    } else {
        env = loadEnv(mode, root)
    }
    return {
        // 部署生产环境和开发环境下的URL。
        // 默认情况下，vite 会假设你的应用是被部署在一个域名的根路径上
        // 例如 https://www.erahub.vip/。如果应用被部署在一个子路径上，你就需要用这个选项指定这个子路径。例如，如果你的应用被部署在 https://www.erahub.vip/admin/，则设置 baseUrl 为 /admin/。
        base: env.VITE_APP_CONTEXT_PATH,
        plugins: [
            Vue(),
            VueJsx(),
            WindiCSS(),
            createVitePlugins(env, command === "build"),
            createStyleImportPlugin({
                resolves: [ElementPlusResolve()],
                libs: [{
                  libraryName: 'element-plus',
                  esModule: true,
                  resolveStyle: (name) => {
                    return `element-plus/es/components/${name.substring(3)}/style/css`
                  }
                }]
              }),
              EslintPlugin({
                cache: false,
                include: ['src/**/*.vue', 'src/**/*.ts', 'src/**/*.tsx'] // 检查的文件
              }),
              VueI18n({
                runtimeOnly: true,
                compositionOnly: true,
                include: [path.resolve(__dirname, 'src/locales/**')]
              }),
              createSvgIconsPlugin({
                iconDirs: [pathResolve('src/assets/svgs')],
                symbolId: 'icon-[dir]-[name]',
                svgoOptions: true
              }),
              VueMarcos(),
              viteCompression({
                verbose: true, // 是否在控制台输出压缩结果
                disable: true, // 是否禁用
                threshold: 10240, // 体积大于 threshold 才会被压缩,单位 b
                algorithm: 'gzip', // 压缩算法,可选 [ 'gzip' , 'brotliCompress' ,'deflate' , 'deflateRaw']
                ext: '.gz', // 生成的压缩包后缀
                deleteOriginFile: false //压缩后是否删除源文件
              }),
              createHtmlPlugin({
                inject: {
                  data: {
                    title: env.VITE_APP_TITLE,
                    injectScript: `<script src="./inject.js"></script>`
                  }
                }
              })
        ],
        resolve: {
            // https://cn.vitejs.dev/config/#resolve-alias
            alias: {
                // 设置路径
                "~": path.resolve(__dirname, "./"),
                // 设置别名
                "@": path.resolve(__dirname, "./src"),
            },
            // https://cn.vitejs.dev/config/#resolve-extensions
            extensions: [".mjs", ".js", ".ts", ".jsx", ".tsx", ".json", ".vue"],
        },
        // vite 相关配置
        server: {
            port: 80,
            host: true,
            open: false,
            proxy: {
                // https://cn.vitejs.dev/config/#server-proxy
                "/dev-api": {
                    target: "http://127.0.0.1:8080",
                    changeOrigin: true,
                    rewrite: (p) => p.replace(/^\/dev-api/, ""),
                },
            },
        },
        //fix:error:stdin>:7356:1: warning: "@charset" must be the first rule in the file
        css: {
            postcss: {
                plugins: [
                    {
                        postcssPlugin: "internal:charset-removal",
                        AtRule: {
                            charset: (atRule) => {
                                if (atRule.name === "charset") {
                                    atRule.remove();
                                }
                            },
                        },
                    },
                ],
            },
        },
        optimizeDeps: {
          include: [
            'vue',
            'vue-router',
            'vue-types',
            'vue-i18n',
            'element-plus/es',
            'element-plus/es/locale/lang/zh-cn',
            'element-plus/es/locale/lang/en',
            '@vueuse/core',
            'axios',
            'qs',
            'dayjs',
            'echarts',
            'echarts-wordcloud',
            'intro.js',
            'qrcode',
            'pinia',
            'crypto-js',
            '@wangeditor/editor',
            '@wangeditor/editor-for-vue'
          ]
        }
    };
});
