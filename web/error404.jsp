<%-- 
    Document   : error404
    Created on : Sep 13, 2022, 10:46:49 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error404</title>
    </head>
    <style>
        @function multiple-shadow($length){
            $value: 2px -1px 0 #000;
            @for $i from 2 through $length{
                $ho: $i * 2;
                $vo: -#{$ho / 2};
                $col: hsl(0deg, 0%, $i * 2%);
                $value: $value, #{$ho}px #{$vo}px 0 $col
            }
            @return $value;
        }

        body{
            @include _flexbox($n, $rw, $n, $c)
        }

        div{
            width: 100%;
            text-align: $c
        }

        .number{
            background: #fff;
            position: $rl;
            font: 900 30vmin 'Consolas';
            letter-spacing: 5vmin;
            text-shadow: multiple-shadow(8);
            @include _pseudo-uncomplete($bf, $bl){
                background-color: #673ab7;
                background-image: radial-gradient(closest-side at 50% 50%, #ffc107 100%, rgba(0, 0, 0, 0)),
                    radial-gradient(closest-side at 50% 50%, #e91e63 100%, rgba(0, 0, 0, 0));
                background-repeat: $rpx;
                background-size: 40vmin 40vmin;
                background-position: -100vmin 20vmin, 100vmin -25vmin;
                @include _dimension(100%);
                mix-blend-mode: screen;
                @include _animation(moving, 10s linear infinite both, to){
                    background-position: 100vmin 20vmin, -100vmin -25vmin
                }
            }
        }

        .text{
            @include _text($n, 400 5vmin 'Courgette', $n);
            span{
                font-size: 10vmin
            }
        }
    </style>
    <body>
        .number 404
        .text
        span Ooops...
        <br>page not found
        |
        |
        a.me(href='https://codepen.io/uzcho_/pens/popular/?grid_type=list' target='_blank')
    </body>
</html>
