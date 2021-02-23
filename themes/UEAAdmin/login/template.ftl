<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
    <!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}" dir="rtl" lang="ar">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="robots" content="noindex, nofollow">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.png" type="image/x-icon">
            <#-- <link rel="stylesheet" type="text/css"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" /> -->

            <#if properties.meta?has_content>
                <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
                </#list>
            </#if>

            <title>${msg("loginTitle",(realm.displayName!''))}</title>
            <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
            

            <#--  Styles => common and resources  -->
            <#if properties.stylesCommon?has_content>
                <#list properties.stylesCommon?split(' ') as style>
                    <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
                </#list>
            </#if>
            <#if properties.styles?has_content>
                <#list properties.styles?split(' ') as style>
                    <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
                </#list>
            </#if>
            
            <#--  Scripts => common and resources  -->
            <#if properties.scripts?has_content>
                <#list properties.scripts?split(' ') as script>
                    <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
                </#list>
            </#if>
            <#if scripts??>
                <#list scripts as script>
                    <script src="${script}" type="text/javascript"></script>
                </#list>
            </#if>
        </head>

        <body class="${properties.kcBodyClass!}">
            <div class="${properties.kcLoginClass!} ${properties.kcContainerClass!} d-flex align-items-center justify-content-center">
                        
                <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                <#-- during login.                                                                               -->
               
                <#if realm.internationalizationEnabled  && locale.supported?size gt 1>

                    <div id="kc-locale">
                        <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                            <div class="kc-dropdown dropdown" id="kc-locale-dropdown">
                                <a href="#" class="dropbtn" onclick="myFunction()" id="kc-current-locale-link">${locale.current}</a>
                                <ul id="myDropdown" class="dropdown-content">
                                    <#list locale.supported as l>
                                        <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                        </#list>
                                </ul>
                            </div>
                        </div>
                    </div>

                    
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>


                </#if>
                    
                <#--  <#if displayMessage && message?has_content && (message.type != ' warning' || !isAppInitiatedAction??)>
                    <div
                        class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                        <div class="pf-c-alert__icon">
                            <#if message.type='success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type='warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type='error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type='info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        </div>
                        <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>                           -->

                <#--  Rendering Form  -->
                <#nested "form">
                       
            </div>
        </body>

    </html>
</#macro>
