<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        
        <div class="card d-flex align-items-stretch w-730">
            <div class="left">
                <div class="img-container"></div>
            </div>
            <div class="right pl-30">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group mb-30">
                            <div class="logo text-center">
                                <img  src="${url.resourcesPath}/img/logo.png" alt="logo">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group row mb-30 d-flex justify-content-center">
                            <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                                <a href="${url.loginUrl}" class="btn-link btn-muted pb-hover font-weight-bold font-size-lg">${msg("doLogIn")}</a>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                                <a href="${url.registrationUrl}" class="btn-link btn-muted pb-hover active font-weight-bold font-size-lg">${msg("doRegister")}</a>
                            </div>
                        </div>
                    </div>
                </div>

                <#--  Register Form  -->
                <form id="kc-register-form" action="${url.registrationAction}" method="post">
                    <div class="row">


                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group mb-20">
                                <label for="firstName">${msg("firstName")}</label>
                                <input type="text" class='form-control' id="firstName" name="firstName" placeholder="${msg("firstName")}"
                                value="${(register.formData.firstName!'')}"
                                aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>">

                                <#if messagesPerField.existsError('firstName')>
                                <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                </span>
                            </#if>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group mb-20">
                                <label for="lastName">${msg("lastName")}</label>
                                <input type="text" class='form-control' id="lastName" name="lastName" 
                                    value="${(register.formData.lastName!'')}" placeholder="${msg("lastName")}"
                                    aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>">

                                    <#if messagesPerField.existsError('lastName')>
                                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                        </span>
                                    </#if>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group mb-20">
                                <label for="email">${msg("email")}</label>
                                <input type="email" class='form-control' id="email" name="email" autocomplete="email"
                                       value="${(register.formData.email!'')}" placeholder="${msg("email")}"
                                       aria-invalid="<#if messagesPerField.existsError('email')>true</#if>">
                                <#if messagesPerField.existsError('email')>
                                    <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </div>

                        <#if !realm.registrationEmailAsUsername>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group mb-20">
                                    <label for="username">${msg("username")}</label>
                                    <input type="text" id="username" class="form-control" name="username"
                                        value="${(register.formData.username!'')}" autocomplete="username"
                                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                    />

                                    <#if messagesPerField.existsError('username')>
                                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </div>
                        </#if>


                         <#if passwordRequired??>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group mb-20">
                                    <label for="password">${msg("password")}</label>
                                    <input type="password" class='form-control' placeholder="********"
                                           id="password" name="password" autocomplete="new-password"
                                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>">
                                    <#if messagesPerField.existsError('password')>
                                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group mb-20">
                                    <label for="password-confirm">${msg("passwordConfirm")}</label>
                                    <input type="password" class='form-control' placeholder="********"
                                        id="password-confirm" name="password-confirm"
                                        aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>">

                                    <#if messagesPerField.existsError('password-confirm')>
                                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </div>
                        </#if>

                        <#if recaptchaRequired??>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group mb-20">
                                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                                </div>
                            </div>
                        </#if>

                        
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <button type="submit" class="btn btn-primary full-width">${msg("doRegister")}</button>
                        </div>

                    </div>
                </form>

            </div>
        </div>
    </#if>
</@layout.registrationLayout>