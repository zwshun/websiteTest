<template>
  <div class="home" ref="UI">
    <div class="header">hello world</div>
  </div>
</template>
 
<script>
export default {
  name: "homePage",
  data() {
    return {
      color: "red",
    };
  },
  mounted() {
    this.setUI();
  },
  methods: {
    setUI() {
      this.$refs.UI.style.setProperty("--color", this.color); //给变量赋值
    },
  },
};
</script>
<style>
.header {
  color: var(--color);
}
</style>

