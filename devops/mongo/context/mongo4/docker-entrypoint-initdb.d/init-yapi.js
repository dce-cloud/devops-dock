const root_user_config = {
  user: 'root',
  password: 'SZsBH3@ueNUPexFI',
}

const yapi_user_config = {
  user: 'yapi',
  password: '123456',
  db: 'yapi'
}

db = db.getSiblingDB('admin');

const rootAuth = db.auth(root_user_config.user, root_user_config.password);
if (!rootAuth) {
  throw new Error(`${root_user_config.user} 用户鉴权失败，请检查用户名和密码`);
}
print(`${root_user_config.user} 用户鉴权成功`);

const yapiDb = db.getSiblingDB(yapi_user_config.db);

try {
  yapiDb.createUser({
    user: yapi_user_config.user,
    pwd: yapi_user_config.password,
    roles: [{ role: "readWrite", db: yapi_user_config.db}]
  });
  print('yapi 用户创建成功');
} catch (err) {
  if (err.code === 11000) { // 用户名已存在的错误码
    print(`${yapi_user_config.user} 用户已存在，跳过创建`);
  } else {
    throw err;
  }
}

const userAuth = yapiDb.auth(yapi_user_config.user, yapi_user_config.password);
if (userAuth) {
  print(`${yapi_user_config.user} 用户鉴权成功`);
} else {
  throw new Error(`${yapi_user_config.user} 用户鉴权失败`);
}

print('\n可通过以下命令登录：');
print(`./mongo 127.0.0.1:27017/${yapi_user_config.db} -u "${yapi_user_config.user}" -p "${yapi_user_config.password}"`);
