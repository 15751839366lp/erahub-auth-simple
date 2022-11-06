import { downloadToRes } from '@/utils/request'

// 导出Html
export function exportHtmlApi() {
  return downloadToRes({ url: '/tool/db-doc/export-html' })
}

// 导出Word
export function exportWordApi() {
  return downloadToRes({ url: '/tool/db-doc/export-word' })
}

// 导出Markdown
export function exportMarkdownApi() {
  return downloadToRes({ url: '/tool/db-doc/export-markdown' })
}
