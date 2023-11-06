This project is a simple Rails CRUD app that lists a couple of notes from a fake online API.

It runs on Ruby 3.2.2, Rails 7.1, and uses all the latest dependencies and gems as of November 2023.

To execute it, first install the dependencies:

```
bundle install
```

Then, start the project via `rails s` command.

To stress the views, you'll need the [hey](https://github.com/rakyll/hey) tool.

Commands:
```
$ hey http://localhost:3000/notes_erb/index

$ hey http://localhost:3000/notes_haml/index

$ hey http://localhost:3000/notes_slim/index
```

# Benchmarks

I ran the benchmarks on my MacBook Pro 16", M1 Pro, 16GB. 2 passes for each templating language. Puma was
restarted between each templating language.

Findings:
- Running benchmarks in the production environment is more than 10 times faster than development.
- All 3 templating languages are roughly equal in terms of performance.

## Request Per Second by environment
-------------------------------------------------------------------------------------
|             | ERB #1   | ERB #2   | SLIM #1   | SLIM #2   | HAML #1   | HAML #2   |
| Development | 45       | 48       | 46        | 49        | 49        | 46        |
| Production  | 566      | 670      | 540       | 702       | 599       | 699       |
-------------------------------------------------------------------------------------


## ## Benchmarking Results - RAILS_ENV=production

Min/Max threads: 5
Workers: 10

TLDR: They're all about the same at approx 700 requests per second once warmed up. Slim and HAML are roughly 5% faster than ERB.

### ERB #1

```
Summary:
  Total:	0.3533 secs
  Slowest:	0.3316 secs
  Fastest:	0.0047 secs
  Average:	0.0753 secs
  Requests/sec:	566.0745

  Total data:	1533800 bytes
  Size/request:	7669 bytes

Response time histogram:
  0.005 [1]	|
  0.037 [103]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.070 [25]	|■■■■■■■■■■
  0.103 [12]	|■■■■■
  0.135 [9]	|■■■
  0.168 [8]	|■■■
  0.201 [21]	|■■■■■■■■
  0.233 [11]	|■■■■
  0.266 [6]	|■■
  0.299 [2]	|■
  0.332 [2]	|■


Latency distribution:
  10% in 0.0077 secs
  25% in 0.0122 secs
  50% in 0.0350 secs
  75% in 0.1355 secs
  90% in 0.2030 secs
  95% in 0.2389 secs
  99% in 0.3283 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0018 secs, 0.0047 secs, 0.3316 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0023 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0004 secs
  resp wait:	0.0728 secs, 0.0046 secs, 0.3204 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0078 secs

Status code distribution:
  [200]	200 responses

```

### ERB #2

```
Summary:
  Total:	0.2986 secs
  Slowest:	0.2282 secs
  Fastest:	0.0054 secs
  Average:	0.0659 secs
  Requests/sec:	669.8688

  Total data:	1533800 bytes
  Size/request:	7669 bytes

Response time histogram:
  0.005 [1]	|■
  0.028 [56]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.050 [33]	|■■■■■■■■■■■■■■■■■■■■■■■■
  0.072 [27]	|■■■■■■■■■■■■■■■■■■■
  0.094 [28]	|■■■■■■■■■■■■■■■■■■■■
  0.117 [24]	|■■■■■■■■■■■■■■■■■
  0.139 [17]	|■■■■■■■■■■■■
  0.161 [6]	|■■■■
  0.184 [4]	|■■■
  0.206 [2]	|■
  0.228 [2]	|■


Latency distribution:
  10% in 0.0091 secs
  25% in 0.0225 secs
  50% in 0.0607 secs
  75% in 0.0994 secs
  90% in 0.1254 secs
  95% in 0.1567 secs
  99% in 0.2258 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0014 secs, 0.0054 secs, 0.2282 secs
  DNS-lookup:	0.0004 secs, 0.0000 secs, 0.0022 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0025 secs
  resp wait:	0.0640 secs, 0.0053 secs, 0.2207 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0055 secs

Status code distribution:
  [200]	200 responses
```

### SLIM #1

```
Summary:
  Total:	0.3701 secs
  Slowest:	0.3536 secs
  Fastest:	0.0049 secs
  Average:	0.0759 secs
  Requests/sec:	540.4134

  Total data:	1286200 bytes
  Size/request:	6431 bytes

Response time histogram:
  0.005 [1]	|
  0.040 [108]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.075 [21]	|■■■■■■■■
  0.109 [14]	|■■■■■
  0.144 [6]	|■■
  0.179 [13]	|■■■■■
  0.214 [18]	|■■■■■■■
  0.249 [11]	|■■■■
  0.284 [5]	|■■
  0.319 [1]	|
  0.354 [2]	|■


Latency distribution:
  10% in 0.0075 secs
  25% in 0.0110 secs
  50% in 0.0315 secs
  75% in 0.1598 secs
  90% in 0.2080 secs
  95% in 0.2436 secs
  99% in 0.3193 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0015 secs, 0.0049 secs, 0.3536 secs
  DNS-lookup:	0.0004 secs, 0.0000 secs, 0.0019 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0035 secs
  resp wait:	0.0737 secs, 0.0048 secs, 0.3466 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0013 secs

Status code distribution:
  [200]	200 responses
```

### SLIM #2

```
Summary:
  Total:	0.2850 secs
  Slowest:	0.1944 secs
  Fastest:	0.0058 secs
  Average:	0.0613 secs
  Requests/sec:	701.6319

  Total data:	1286200 bytes
  Size/request:	6431 bytes

Response time histogram:
  0.006 [1]	|■
  0.025 [49]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.044 [37]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.062 [34]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.081 [23]	|■■■■■■■■■■■■■■■■■■■
  0.100 [16]	|■■■■■■■■■■■■■
  0.119 [11]	|■■■■■■■■■
  0.138 [14]	|■■■■■■■■■■■
  0.157 [6]	|■■■■■
  0.176 [3]	|■■
  0.194 [6]	|■■■■■


Latency distribution:
  10% in 0.0101 secs
  25% in 0.0249 secs
  50% in 0.0503 secs
  75% in 0.0882 secs
  90% in 0.1310 secs
  95% in 0.1565 secs
  99% in 0.1925 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0020 secs, 0.0058 secs, 0.1944 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0026 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0078 secs
  resp wait:	0.0585 secs, 0.0058 secs, 0.1944 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0055 secs

Status code distribution:
  [200]	200 responses
```

### HAML #1

```
Summary:
  Total:	0.3340 secs
  Slowest:	0.2974 secs
  Fastest:	0.0053 secs
  Average:	0.0712 secs
  Requests/sec:	598.8734

  Total data:	1296600 bytes
  Size/request:	6483 bytes

Response time histogram:
  0.005 [1]	|
  0.034 [100]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.064 [28]	|■■■■■■■■■■■
  0.093 [11]	|■■■■
  0.122 [8]	|■■■
  0.151 [9]	|■■■■
  0.181 [16]	|■■■■■■
  0.210 [13]	|■■■■■
  0.239 [5]	|■■
  0.268 [4]	|■■
  0.297 [5]	|■■


Latency distribution:
  10% in 0.0077 secs
  25% in 0.0109 secs
  50% in 0.0343 secs
  75% in 0.1404 secs
  90% in 0.2034 secs
  95% in 0.2380 secs
  99% in 0.2920 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0023 secs, 0.0053 secs, 0.2974 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0026 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0012 secs
  resp wait:	0.0683 secs, 0.0052 secs, 0.2896 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0004 secs

Status code distribution:
  [200]	200 responses
```

### HAML #2

```
Summary:
  Total:	0.2863 secs
  Slowest:	0.2503 secs
  Fastest:	0.0055 secs
  Average:	0.0590 secs
  Requests/sec:	698.5472

  Total data:	1296600 bytes
  Size/request:	6483 bytes

Response time histogram:
  0.005 [1]	|■
  0.030 [76]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.054 [33]	|■■■■■■■■■■■■■■■■■
  0.079 [27]	|■■■■■■■■■■■■■■
  0.103 [26]	|■■■■■■■■■■■■■■
  0.128 [19]	|■■■■■■■■■■
  0.152 [8]	|■■■■
  0.177 [7]	|■■■■
  0.201 [1]	|■
  0.226 [1]	|■
  0.250 [1]	|■


Latency distribution:
  10% in 0.0089 secs
  25% in 0.0200 secs
  50% in 0.0455 secs
  75% in 0.0913 secs
  90% in 0.1265 secs
  95% in 0.1539 secs
  99% in 0.2159 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0017 secs, 0.0055 secs, 0.2503 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0020 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0004 secs
  resp wait:	0.0567 secs, 0.0054 secs, 0.2406 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0043 secs

Status code distribution:
  [200]	200 responses
```


## Benchmarking Results - RAILS_ENV=development

TLDR: They're all about the same at approx 45-50 requests per second.

### ERB #1

```
Summary:
  Total:	4.4066 secs
  Slowest:	4.3665 secs
  Fastest:	0.0131 secs
  Average:	0.6361 secs
  Requests/sec:	45.3862

  Total data:	1533800 bytes
  Size/request:	7669 bytes

Response time histogram:
  0.013 [1]	|
  0.448 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.884 [5]	|■
  1.319 [2]	|■
  1.755 [4]	|■
  2.190 [5]	|■
  2.625 [5]	|■
  3.061 [6]	|■■
  3.496 [6]	|■■
  3.931 [5]	|■
  4.367 [7]	|■■


Latency distribution:
  10% in 0.0165 secs
  25% in 0.0495 secs
  50% in 0.0688 secs
  75% in 0.2975 secs
  90% in 2.8132 secs
  95% in 3.6894 secs
  99% in 4.2833 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0013 secs, 0.0131 secs, 4.3665 secs
  DNS-lookup:	0.0006 secs, 0.0000 secs, 0.0030 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0006 secs
  resp wait:	0.6340 secs, 0.0131 secs, 4.3573 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0004 secs

Status code distribution:
  [200]	200 responses
```

### ERB #2

```
Summary:
  Total:	4.1265 secs
  Slowest:	4.0840 secs
  Fastest:	0.0128 secs
  Average:	0.5612 secs
  Requests/sec:	48.4678

  Total data:	1533800 bytes
  Size/request:	7669 bytes

Response time histogram:
  0.013 [1]	|
  0.420 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.827 [5]	|■
  1.234 [5]	|■
  1.641 [5]	|■
  2.048 [5]	|■
  2.456 [3]	|■
  2.863 [5]	|■
  3.270 [5]	|■
  3.677 [6]	|■■
  4.084 [6]	|■■


Latency distribution:
  10% in 0.0171 secs
  25% in 0.0503 secs
  50% in 0.0640 secs
  75% in 0.0882 secs
  90% in 2.4831 secs
  95% in 3.3724 secs
  99% in 3.9830 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0013 secs, 0.0128 secs, 4.0840 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0026 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0003 secs
  resp wait:	0.5594 secs, 0.0128 secs, 4.0764 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0015 secs

Status code distribution:
  [200]	200 responses
```

### SLIM #1

```
Summary:
  Total:	4.3526 secs
  Slowest:	4.3116 secs
  Fastest:	0.0124 secs
  Average:	0.6273 secs
  Requests/sec:	45.9499

  Total data:	1286200 bytes
  Size/request:	6431 bytes

Response time histogram:
  0.012 [1]	|
  0.442 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.872 [5]	|■
  1.302 [0]	|
  1.732 [6]	|■■
  2.162 [5]	|■
  2.592 [5]	|■
  3.022 [5]	|■
  3.452 [7]	|■■
  3.882 [6]	|■■
  4.312 [6]	|■■


Latency distribution:
  10% in 0.0167 secs
  25% in 0.0441 secs
  50% in 0.0624 secs
  75% in 0.3155 secs
  90% in 2.7864 secs
  95% in 3.5799 secs
  99% in 4.1685 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0021 secs, 0.0124 secs, 4.3116 secs
  DNS-lookup:	0.0011 secs, 0.0000 secs, 0.0048 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0004 secs
  resp wait:	0.6247 secs, 0.0124 secs, 4.3005 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0002 secs

Status code distribution:
  [200]	200 responses
```

### SLIM #2

```
Summary:
  Total:	4.0675 secs
  Slowest:	4.0218 secs
  Fastest:	0.0130 secs
  Average:	0.5474 secs
  Requests/sec:	49.1701

  Total data:	1286200 bytes
  Size/request:	6431 bytes

Response time histogram:
  0.013 [1]	|
  0.414 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.815 [5]	|■
  1.216 [5]	|■
  1.617 [5]	|■
  2.017 [5]	|■
  2.418 [5]	|■
  2.819 [4]	|■
  3.220 [4]	|■
  3.621 [6]	|■■
  4.022 [6]	|■■


Latency distribution:
  10% in 0.0176 secs
  25% in 0.0419 secs
  50% in 0.0622 secs
  75% in 0.0976 secs
  90% in 2.4430 secs
  95% in 3.3024 secs
  99% in 3.8339 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0011 secs, 0.0130 secs, 4.0218 secs
  DNS-lookup:	0.0003 secs, 0.0000 secs, 0.0019 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0001 secs
  resp wait:	0.5463 secs, 0.0130 secs, 4.0168 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0001 secs

Status code distribution:
  [200]	200 responses
```

### HAML #1

```
Summary:
  Total:	4.0505 secs
  Slowest:	3.9698 secs
  Fastest:	0.0130 secs
  Average:	0.5889 secs
  Requests/sec:	49.3765

  Total data:	1296600 bytes
  Size/request:	6483 bytes

Response time histogram:
  0.013 [1]	|
  0.409 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.804 [1]	|
  1.200 [4]	|■
  1.596 [6]	|■■
  1.991 [5]	|■
  2.387 [6]	|■■
  2.783 [5]	|■
  3.178 [6]	|■■
  3.574 [5]	|■
  3.970 [7]	|■■


Latency distribution:
  10% in 0.0143 secs
  25% in 0.0302 secs
  50% in 0.0593 secs
  75% in 0.3112 secs
  90% in 2.6879 secs
  95% in 3.4525 secs
  99% in 3.9420 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0016 secs, 0.0130 secs, 3.9698 secs
  DNS-lookup:	0.0006 secs, 0.0000 secs, 0.0027 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0010 secs
  resp wait:	0.5865 secs, 0.0130 secs, 3.9595 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0001 secs

Status code distribution:
  [200]	200 responses
### HAML #2

Summary:
  Total:	4.3764 secs
  Slowest:	4.3295 secs
  Fastest:	0.0134 secs
  Average:	0.5954 secs
  Requests/sec:	45.7000

  Total data:	1296600 bytes
  Size/request:	6483 bytes

Response time histogram:
  0.013 [1]	|
  0.445 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.877 [5]	|■
  1.308 [5]	|■
  1.740 [5]	|■
  2.171 [5]	|■
  2.603 [5]	|■
  3.035 [3]	|■
  3.466 [5]	|■
  3.898 [6]	|■■
  4.329 [6]	|■■


Latency distribution:
  10% in 0.0191 secs
  25% in 0.0523 secs
  50% in 0.0703 secs
  75% in 0.0985 secs
  90% in 2.6405 secs
  95% in 3.5070 secs
  99% in 4.2124 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0015 secs, 0.0134 secs, 4.3295 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0028 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.5931 secs, 0.0134 secs, 4.3198 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0001 secs

Status code distribution:
  [200]	200 responses

```

### HAML #2

```
Summary:
  Total:	4.3764 secs
  Slowest:	4.3295 secs
  Fastest:	0.0134 secs
  Average:	0.5954 secs
  Requests/sec:	45.7000

  Total data:	1296600 bytes
  Size/request:	6483 bytes

Response time histogram:
  0.013 [1]	|
  0.445 [154]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.877 [5]	|■
  1.308 [5]	|■
  1.740 [5]	|■
  2.171 [5]	|■
  2.603 [5]	|■
  3.035 [3]	|■
  3.466 [5]	|■
  3.898 [6]	|■■
  4.329 [6]	|■■


Latency distribution:
  10% in 0.0191 secs
  25% in 0.0523 secs
  50% in 0.0703 secs
  75% in 0.0985 secs
  90% in 2.6405 secs
  95% in 3.5070 secs
  99% in 4.2124 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0015 secs, 0.0134 secs, 4.3295 secs
  DNS-lookup:	0.0005 secs, 0.0000 secs, 0.0028 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.5931 secs, 0.0134 secs, 4.3198 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0001 secs

Status code distribution:
  [200]	200 responses
```
