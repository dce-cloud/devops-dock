db = db.getSiblingDB('admin');

const rootAuth = db.auth('root', 'SZsBH3@ueNUPexFI');
if (!rootAuth) {
  throw new Error('root 用户鉴权失败，请检查用户名和密码');
}
print('root 用户鉴权成功');

const yapiDb = db.getSiblingDB('yapi');

try {
  yapiDb.createUser({
    user: "yapi",
    pwd: "123456",
    roles: [{ role: "readWrite", db: "yapi" }]
  });
  print('my_yapi 用户创建成功');
} catch (err) {
  if (err.code === 11000) { // 用户名已存在的错误码
    print('yapi 用户已存在，跳过创建');
  } else {
    throw err;
  }
}

const userAuth = yapiDb.auth('yapi', '123456');
if (userAuth) {
  print('my_yapi 用户鉴权成功');
} else {
  throw new Error('my_yapi 用户鉴权失败');
}

print('\n可通过以下命令登录：');
print(`./mongo 127.0.0.1:27017/yapi -u "my_yapi" -p "123456"`);
