<template>
    <div>
        <h1 class="alert alert-info">fourthApp 입니다</h1>
        <ul>
            <li v-for="fruit in fruitArray" :key="fruit" >{{ fruit }}</li>
            <li v-for="info in infoArray" :key="info">{{ info.id + info.user  }}</li>

        </ul>
    </div>
</template>

<script>
export default {
    setup () {
        
        const fruitArray=["apple","banana","orange"];
        const infoArray = [{id:0,user:"영수"},{id:1,user:"영식"},
        {id:2,user:"영철"},{id:3,user:"정수"}]

        return {
            fruitArray,
            infoArray

        }
    }
}
</script>

<style lang="css" scoped>

</style>