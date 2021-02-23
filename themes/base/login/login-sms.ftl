<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
	<#if section = "header">
		${msg("smsAuthTitle",realm.displayName)}
	<#elseif section = "form">
        <form id="kc-sms-code-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
    <div class="${properties.kcFormGroupClass!}">
        <div class="${properties.kcLabelWrapperClass!}">
            <label for="code" class="${properties.kcLabelClass!}">${msg("smsAuthLabel")}</label>
        </div>
        <div class="${properties.kcInputWrapperClass!}">
            <input type="text" id="code" name="code" class="${properties.kcInputClass!}" autofocus/>
        </div>
    </div>
    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
            <div class="${properties.kcFormOptionsWrapperClass!}">
                <span>
                    <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </span>
            </div>
        </div>
        <div class="input-group-inside is-reverse">
            <span class="${properties.kcLabelClass!}" id="timeTTL"></span>
            <button id="kc-resend" id="kc-resend" type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" onclick="deleteCookie('kc.ttl')" disabled>
              ${msg("sms-auth.resend")}
            </button>
        </div>
    </div>
</div>
<div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
    <input id="kc-login-otp" name="kc-login-otp" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("dosubmit")}"/>
</div></div><script async src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script><script async>
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) 
        return parts.pop().split(";").shift();
}

function setCookie(name, value, seconds) {
    var expires = "";
    if (seconds) {
        var date = new Date();
        date.setTime(date.getTime() + (seconds * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (
        value || ""
    ) + expires + "; path=/auth/realms/";
}

function deleteCookie(name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;path=/auth/realms/';
    var otpTextBox = document.getElementById('code');
    otpTextBox.value = '_ _ _ _';
    otpTextBox.disabled = true;
    var otpButton = document.getElementById('kc-login-otp');
    otpButton.disabled = true;
}

function startTimer(duration, display) {
    var timerCookie = getCookie("kc.ttl");

    var timer = duration,
        minutes,
        seconds;
    if (! timerCookie || document.cookie.indexOf("kc.ttl") == -1) {
        setCookie("kc.ttl", timer, duration);
    } else {
        timer = timerCookie;
        // display.textContent = minutes + ":" + seconds;
    }
    var myInterval = setInterval(function () {
        setCookie("kc.ttl", timer, duration);
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        --timer;
        if (timer < 0) {
            document.getElementById("kc-resend").disabled = false;
            clearInterval(myInterval);
            deleteCookie("kc.ttl");
        }
    }, 1000);
}

window.onload = function () {
    var otpTimer = getCookie("kc.ttl");
    if (otpTimer == null) {
        var seconds = 60 * 3,
            display = document.querySelector('#timeTTL');
        startTimer(seconds, display);
    } else {
        display = otpTimer = document.querySelector('#timeTTL');
        startTimer(otpTimer, display);
    }
};</script></form>
   
  <#elseif section = "info" >
		${msg("smsAuthInstruction")}
	</#if>
</@layout.registrationLayout>
