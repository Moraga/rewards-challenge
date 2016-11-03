

Run test:
---------

```
sbcl --load test
```

```
clisp test
```


Run webserver:
----------

```
sbcl --load webserver
```

Users and scores as JSON


```
GET http://localhost:5000/
```


Adds new invitation


```
POST http://localhost:5000/
```


with payload


```
user=<number>&invited=<number>
```


Requirements:
---------

* quicklisp: ningle

curl -O https://beta.quicklisp.org/quicklisp.lisp

sbcl --load quicklisp

(quicklisp-quickstart:install)

