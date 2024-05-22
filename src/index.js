function sleep(ms) {  
    return new Promise(resolve => setTimeout(resolve, ms));  
}

async function main() {
    console.log("start");
    await sleep(5000);
    console.log("awake");
}

main();
