Breaching Buckets

```
Take a look at where this image is hosted. See if you can find the flag! Does anything stand out?
```

1. `aws s3 ls prod-cdn-user-imgs --recursive`
1. `aws s3 cp --recursive s3://prod-cdn-user-imgs .`
1. browse all pictures for flag