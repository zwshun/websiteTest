<template>
  <div id="banner">
    <div class="leftArrow" ref="leftArrowUI">
      <el-image
        style="width: 66.47px; height: 99.47px"
        :src="leftImg"
        @click="arrowClick('left')"
      ></el-image>
    </div>
     <!--动态将图片轮播图的容器高度设置成与图片一致-->
        <el-carousel
      :height="bannerHeight + 'px'"
      :interval="carouselTime"
      indicator-position="none"
      arrow="never"
      ref="cardShow"
    >
            <!--遍历图片地址,动态生成轮播图-->
            <el-carousel-item v-for="item in img_list" :key="item">
        <img :src="item" alt />            
        <!-- <el-image :src="item" :fit="fit"></el-image> -->
      </el-carousel-item>
        </el-carousel
    >
    <div class="rightArrow" ref="rightArrowUI">
      <el-image
        style="width: 66.47px; height: 99.47px"
        :src="rightImg"
        @click="arrowClick('right')"
      ></el-image>
    </div>
    <div id="footer">
      <el-row class="font1">
        <el-col :span="6"
          ><div class="grid-content bg-purple">
            <span class="span1">联系地址</span>
          </div></el-col
        >
        <el-col :span="3"
          ><div class="grid-content bg-purple-light">
            <span>微博官方账号</span>
          </div>
        </el-col>
        <el-col :span="3"
          ><div class="grid-content bg-purple">
            <span>微信公众号</span>
          </div></el-col
        >
        <el-col :span="3"
          ><div class="grid-content bg-purple-light">
            <span>抖音官方账号</span>
          </div></el-col
        >
        <el-col :span="4"
          ><div class="grid-content bg-purple">
            <span>京ICP备19003731号-5</span>
          </div></el-col
        >
        <el-col :span="5"
          ><div class="grid-content bg-purple-light">
            <span>
              <a href="#" @click="yhxy">《用户协议》</a>
              <a href="#" @click="yszc">《隐私政策》</a></span
            >
          </div></el-col
        >
      </el-row>
      <el-row class="font2">
        <el-col :span="6"
          ><div class="grid-content bg-purple">
            <span class="span1">北京市 朝阳区 三里屯西五街5号院</span>
          </div></el-col
        >
        <el-col :span="3"
          ><div class="grid-content bg-purple-light">
            <span>@POKEDO破壳豆</span>
          </div></el-col
        >
        <el-col :span="3"
          ><div class="grid-content bg-purple">
            <span>POKEDO破壳豆</span>
          </div></el-col
        >
        <el-col :span="3"
          ><div class="grid-content bg-purple-light">
            <span>POKEDO破壳豆</span>
          </div></el-col
        >
        <el-col :span="9"
          ><div class="grid-content bg-purple">
            <span>Copyright 2020 - 2021 Pokedo. All Rights Reserved</span>
          </div></el-col
        >
      </el-row>
    </div>
  </div>
</template>



<script>
export default {
  name: "homePage",
  data() {
    return {
      // 图片地址数组
      img_list: [
        require("@/assets/huaban1.png"),
        require("@/assets/huaban2.png"),
        require("@/assets/huaban3.png"),
        require("@/assets/huaban4.png"),
      ],
      bannerHeight: 0, // 图片父容器高度
      screenWidth: 0, // 浏览器宽度
      leftImg: require("@/assets/left.png"),
      rightImg: require("@/assets/right.png"),
      carouselTime: 5000,
      fit: "fill",
    };
  },

  mounted() {
    // 首次加载时,需要调用一次
    this.screenWidth = window.innerWidth;
    this.setSize();
    this.setUI();
    // 窗口大小发生改变时,调用一次
    window.onresize = () => {
      this.screenWidth = window.innerWidth;
      this.setSize();
      this.setUI();
    };
  },
  methods: {
    setSize: function () {
      // 通过浏览器宽度(图片宽度)计算高度
      this.bannerHeight = (1080 / 1920) * this.screenWidth; //window.innerHeight
      // if (this.bannerHeight > window.innerHeight) {
      //   this.bannerHeight = window.innerHeight;
      // }
    },
    arrowClick(val) {
      if (val === "right") {
        this.$refs.cardShow.next();
      } else {
        this.$refs.cardShow.prev();
      }
    },
    setUI() {
      this.$refs.leftArrowUI.style.setProperty(
        "--leftBannerHeight",
        this.bannerHeight / 2 + "px"
      ); //给变量赋值
      this.$refs.rightArrowUI.style.setProperty(
        "--rightBannerHeight",
        this.bannerHeight / 2 + "px"
      ); //给变量赋值
    },
    yhxy() {
      // window.open(
      //   "https://view.officeapps.live.com/op/view.aspx?src=" +
      //     require("@/assets/POKEDOyhxy.docx")
      // );
      let routeUrl = this.$router.resolve("/yhxy");
      window.open(routeUrl.href, "_blank");
    },
    yszc() {
      //this.$router.push("/yszc");
      let routeUrl = this.$router.resolve("/yszc");
      window.open(routeUrl.href, "_blank");
    },
  },
};
</script>



<style scoped>
#banner {
  width: 100%;
  height: 100%;
  padding: 0;
  margin: 0;
}
img {
  /*设置图片宽度和浏览器宽度一致*/
  width: 100%;
  height: inherit;
}

#footer {
  position: absolute;
  z-index: 9999;
  width: 100%;
  height: 117px;
  background: rgba(0, 0, 0, 0.5);
  opacity: 1;
  text-align: left;
  position: fixed;
  bottom: 0;
}
.font1 {
  /* width: 224px; */
  height: 30px;
  font-size: 15px;
  font-family: PingFang SC;
  font-weight: 400;
  line-height: 40px;
  color: #ffffff;
  opacity: 1;
  margin-top: 20px;
}
.font2 {
  /* width: 397px; */
  height: 37px;
  font-size: 18px;
  font-family: PingFang SC;
  font-weight: 400;
  line-height: 40px;
  color: #ffffff;
  opacity: 1;
}
.span1 {
  margin-left: 70px;
}
.leftArrow {
  width: 100px;
  height: 100px;
  position: absolute;
  left: 10px;
  top: var(--leftBannerHeight); /* 50%*/
  z-index: 9999;
}
.rightArrow {
  width: 100px;
  height: 100px;
  position: absolute;
  right: 10px;
  top: var(--rightBannerHeight);
  z-index: 9999;
}
a {
  text-decoration: none;
}
</style>

