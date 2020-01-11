const os = require("os");

console.log(os.arch());

console.log(os.homedir());

console.log(os.networkInterfaces().en0[1].address);

console.log(os.platform());

console.log(os.uptime());

console.log(os.userInfo());

const cp = require('child_process');

// cp.spawn("ls", ["-lh", "/"]).stdout.on("data", data => {
//     console.log(`${data}`);
// })
// cp.exec(`ls -lh /`, (err, stdout, stderr) => {
//     console.log(`${stdout}`);
// })

let result = cp.execSync(`cat ./os.js`)
console.log(result.toString("utf-8"));

