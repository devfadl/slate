<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">

    <div class="card d-flex align-items-center p-40 w-550">
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group mb-30">
                        <div class="logo text-center">
                            <img  src="${url.resourcesPath}/img/logo.png" alt="logo">
                        </div>
                    </div>
                </div>

                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group text-center mb-30">
                        <h4 class="text-primary font-size-h5 font-weight-normal">${msg("forgotPassword")}</h4>
                        <p class="text-muted font-size-sm">${msg("emailInstruction")}</p>
                    </div>
                </div>
                
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group mb-20">
                        <label for="username">
                            <#if !realm.loginWithEmailAllowed>
                                ${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>
                                ${msg("usernameOrEmail")}
                            <#else>
                                ${msg("email")}
                            </#if>
                        </label>

                         <#if auth?has_content && auth.showUsername()>
                            <input type="text" class='form-control' placeholder="username"
                                id="username" name="username" autofocus value="${auth.attemptedUsername}"
                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>">
                        <#else>
                            <input type="text" class='form-control' placeholder="youremail@example.com"
                                id="username" name="username" autofocus 
                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>">
                        </#if>

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>

                    </div>
                </div>

                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group mb-20">
                        <button class="btn btn-primary full-width" type="submit" value="${msg('doSubmit')}">${msg('doSubmit')}</button>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group text-center m-0">
                        <span><a href="${url.loginUrl}" class="text-primary text-decoration-underline">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

            </div>
        </form>
    </div>
    
    
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
