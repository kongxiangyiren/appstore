# 创建应用模板

```sh
cd apps
1panel app init -k <应用的key（仅支持英文）> -v <应用版本>
```

## 使用

```sh
rm -r /opt/1panel/resource/apps/local
```

```sh
git clone https://gitee.com/kongxiangyiren/appstore /opt/1panel/resource/apps/local/appstore-localApps
```

```sh
cp -rf /opt/1panel/resource/apps/local/appstore-localApps/apps/* /opt/1panel/resource/apps/local/
```

```sh
rm -r /opt/1panel/resource/apps/local/appstore-localApps
```
