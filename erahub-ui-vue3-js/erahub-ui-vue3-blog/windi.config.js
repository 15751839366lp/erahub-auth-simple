import { defineConfig } from 'vite-plugin-windicss'
import plugin from 'windicss/plugin'

function range(size, startAt = 1) {
  return Array.from(Array(size).keys()).map((i) => i + startAt)
}

export default defineConfig({
  extract: {
    // 目前无法指定文件
    include: ['src/**/*.{vue,html,jsx,tsx}'],
    exclude: [
      'node_modules', 
      '.git', 
      // 如果临时需要windicss，注释掉下行
      'src/**/*.{vue,html,jsx,tsx}'
    ]
  },
  darkMode: 'class',
  attributify: false,
  theme: {
    extend: {
      backgroundColor: {
        // 暗黑背景色
        'v-dark': 'var(--dark-bg-color)'
      }
    }
  },
  plugins: [
    plugin(({ addComponents }) => {
      const obj = {}
      range(50).map((i) => {
        obj[`.border-top-${i}`] = {
          borderTopWidth: `${i}px`
        }
        obj[`.border-left-${i}`] = {
          borderLeftWidth: `${i}px`
        }
        obj[`.border-right-${i}`] = {
          borderRightWidth: `${i}px`
        }
        obj[`.border-bottom-${i}`] = {
          borderBottomWidth: `${i}px`
        }
      })
      addComponents({
        '.hover-tigger': {
          display: 'flex',
          height: '100%',
          padding: '1px 10px 0',
          cursor: 'pointer',
          alignItems: 'center',
          transition: 'background var(--transition-time-02)',
          '&:hover': {
            backgroundColor: 'var(--top-header-hover-color)'
          }
        },
        '.dark .hover-tigger': {
          '&:hover': {
            backgroundColor: 'var(--el-bg-color-overlay)'
          }
        },
        ...obj
      })
    })
  ]
})
