<template lang="pug">
  v-app
    v-navigation-drawer(
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
    )
      v-list
        v-list-tile(
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        )
          v-list-tile-action
            v-icon {{ item.icon }}
          v-list-tile-content
            v-list-tile-title(v-text="item.title")
    v-toolbar(:clipped-left="clipped" fixed app)
      v-toolbar-side-icon(@click="drawer = !drawer")
      v-btn(icon @click.stop="miniVariant = !miniVariant")
        v-icon {{ `chevron_${miniVariant ? 'right' : 'left'}` }}
      v-btn(icon @click.stop="clipped = !clipped")
        v-icon web
      v-btn(icon @click.stop="fixed = !fixed")
        v-icon(remove)
      v-toolbar-title(v-text="title")
      v-spacer
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
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'apps',
          title: 'JOBs',
          to: '/jobs'
        },
        {
          icon: 'bubble_chart',
          title: 'sample',
          to: '/sample'
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'babystep'
    }
  }
}
</script>

<style lang="sass" scoped>
.footer
  text-align: center
</style>
