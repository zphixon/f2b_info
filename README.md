# f2b_info

A simple Lua script that shows geolocation information of banned
[Fail2Ban](http://www.fail2ban.org/wiki/index.php/Main_Page) IP addresses.

Assumes your f2b logs are in `/var/log/fail2ban.log`.

Example output:

```
Reading f2b logs
Parsing logs
Getting locations \
Found 45 locations
Padang, Indonesia:             180.250.39.54
Shenzhen, China:               116.31.116.9
Chongqing, China:              222.179.189.206
Central District, Hong Kong:   168.70.46.41
Sanwer, India:                 182.70.161.76
Hangzhou, China:               125.118.35.114
Saint Petersburg, Russia:      5.101.40.10
Yokohama, Japan:               153.151.211.131
Breda, Netherlands:            145.118.2.68
unknown, France:               5.196.20.235
Florencio Varela, Argentina:   201.178.197.101
Beijing, China:                119.29.172.26
Changsha, China:               175.6.27.205
São Paulo, Brazil:            191.96.4.142
Shenyang, China:               123.177.17.19
unknown, France:               5.196.211.27
Samara, Russia:                109.169.128.210
```

