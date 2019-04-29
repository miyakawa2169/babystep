<template lang="pug">
  v-app
    v-toolbar
      v-icon.hidden-md-and-up more_vert
      v-toolbar-title babystep
      v-spacer
      v-toolbar-items
        v-btn(flat) 案件一覧
        v-btn(flat) マイページ
        v-btn(flat) ログアウト
    v-layout
      v-card.hidden-sm-and-down(width="30%")
        v-text-field(label="検索キーワード")
        v-btn(color="info") search

        v-select(:items="items" label="カテゴリ" outline)

        v-chip(label) タグ１
        v-chip(outline) タグ２
        v-chip(selected) タグ３
        v-chip(small) タグ４
        v-chip(text-color="orange") タグ５
        v-chip(small color="primary") タグ6
        v-chip(small color="secondary") タグ7
        v-chip(small color="green") タグ8
        v-chip(small color="#aaaaaa") タグ9

        v-list
          v-divider
          v-list-tile-content コンテンツ
            v-list-tile(ripple) タイル
          v-list-tile-action アクション
            v-icon star_border
          v-divider
          v-list-tile タイル
          v-list-tile-content コンテンツ
          v-list-tile-action アクション
            v-icon star_border
          v-divider
          v-list-tile タイル
          v-list-tile-content コンテンツ
          v-list-tile-action アクション
            v-icon star_border
          v-divider

      v-content
        v-container
          nuxt
    v-footer.footer(:fixed="fixed" app)
      span &copy; 2019 babystep
</template>

<script>
export default {
  data() {
    return {
      items: ['農業', 'IT', 'エンタメ', 'サービス']
    }
  }
}
</script>

<style lang="sass" scoped>
.footer
  text-align: center
</style>
