        function emptyCart() {
            var aCookie = document.cookie.split(";");
            var re = '';
            for (var i = 0; i < aCookie.length; i++) {
                var aCrumb = aCookie[i].split("_");
                var name = aCookie[i].split("=");
            //    alert(name[0]);
                if (aCrumb[0].toString().trim() != 'yumiyumi') {
                        continue;
                }
                var d = new Date();
                d.setTime(d.getTime() + (-1 * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                setCookie(name[0], "", expires);
                aCookie[i].split("_");
                    re += (aCrumb[0] + " # " + aCrumb[1] + '\n\n');
                }
            alert('cookie info:\n' + re);
        }