<template>
  <div style="text-align:center;margin-top:40px">
    <h1>Counter: {{ count }}</h1>
    <button @click="inc()">Increment</button>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
const count = ref(0)
const URL = import.meta.env.VITE_BACKEND_URL

async function fetchCount() {
  const res = await fetch(`${URL}/api/count`)
  count.value = (await res.json()).count
}

async function inc() {
  const res = await fetch(`${URL}/api/increment`, { method: 'POST' })
  count.value = (await res.json()).count
}

onMounted(fetchCount)
</script>
