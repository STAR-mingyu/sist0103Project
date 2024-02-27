<template>
    <div>
<h1 class="alert alert-info">FirstApp 입니다</h1>
<h2>반응형 메세지</h2>
<h3>{{ reactiveMessage }}</h3>

<button v-on:click="btnReactiveMessage">Add Message</button>

<h2>일반 메세지</h2>
<h2>{{ nomalMessage }}</h2>
<button v-on:click="btnnomalMessage">Add Message</button>
    </div>
</template>

<script>
import { isRef, onBeforeMount, onMounted, ref } from 'vue';

export default {
    setup () {
        
        const reactiveMessage=ref("Hollo Reactive");
        const btnReactiveMessage=()=>{
            reactiveMessage.value=reactiveMessage.value+"!";
        }
        // 반응형인지 검사
        console.log(isRef(reactiveMessage))
        let nomalMessage="Nomal Message";
        const btnnomalMessage = ()=> {
            nomalMessage=nomalMessage+"!"
        }

        onMounted(()=>{
            console.log("onMounted");
        })
        onBeforeMount(()=>{
            console.log("onBeforeMount");
        })


        return {
            reactiveMessage,
            nomalMessage,
            btnReactiveMessage,
            btnnomalMessage
        }
    }
}
</script>

<style lang="css" scoped>

</style>