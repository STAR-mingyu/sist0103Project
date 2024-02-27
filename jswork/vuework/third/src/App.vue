<template>
  <div>
    <div class="menu">
          <!-- <a href="" v-for="header in 3" :key="header">Home</a> -->
    <a href="#" v-for="menu in menus" :key="menu">{{ menu }}</a>
    </div>

    <div class="celeb" v-for="(titles,key) in title" :key="key">
      <img :src="titles.imgSrc" alt="">
      <h3>{{titles.name}}</h3>
      <p>{{titles.company}}</p>
      <button type="button" @click="onClickLikes(key)">좋아요</button>
      <span>좋아요:{{titles.likes}}</span>
    </div>



  </div>
</template>

<script>
export default {
  data () {
    
    return {
      menus:["Home","Celeb","About"],
      title:[{name:"캐릭터1",company:"만화1",likes:0,imgSrc:require("./assets/01.png")}
    ,{name:"캐릭터2",company:"만화2",likes:0,imgSrc:require("./assets/02.png")}
  ,{name:"캐릭터3",company:"만화3",likes:0,imgSrc:require("./assets/03.png")}
,{name:"캐릭터4",company:"만화4",likes:0,imgSrc:require("./assets/04.png")}
,{name:"캐릭터5",company:"만화5",likes:0,imgSrc:require("./assets/05.png")}
,{name:"캐릭터6",company:"만화6",likes:0,imgSrc:require("./assets/06.png")}]

    }
    

  },
  methods:{
  onClickLikes(num) {
    this.title[num].likes++;
  }
}
}
</script>

<style lang="css" scoped>
.menu {
  background-color: darkcyan;
  height: 60px;
  line-height: 60px;
  font-weight: 700;
  color: #fff;
  padding-left: 40px;
}

.menu  a {
  color: #fff;
  text-decoration: none;
  margin-right: 20px;
}
</style>