<template>
  <div>
    <div id="backgroundImage">
      <img :src="img" />
    </div>
    <div id="onbackgroundbody"></div>
  </div>
</template>
<script>
export default {
  name: "test",
  data() {
    return {
      img: require("@/assets/huaban1.png"),
    };
  },
  mounted() {},
};
</script>
<style>
html {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
#backgroundImage {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  overflow: hidden;
  z-index: -1;
}
#backgroundImage img {
  width: 100%;
  height: 100%;
}
#onbackgroundbody {
  width: 100%;
  height: 100%;
}
</style>