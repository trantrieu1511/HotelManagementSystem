<%-- 
    Document   : settings-menu
    Created on : Sep 16, 2022, 2:25:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings Menu Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body">
                    <div class="">
                        <ul class="" style="list-style: none; padding-left: 1rem;">
                            <li style="${settingOption == 1 ? " text-decoration: underline;" : ""}">
                                <h6>
                                    <a href="customer?do=displayCustomerDetails">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M22.5 17.25a5.25 5.25 0 1 1-10.5 0 5.25 5.25 0 0 1 10.5 0zm1.5 0a6.75 6.75 0 1 0-13.5 0 6.75 6.75 0 0 0 13.5 0zm-7.5-3v6a.75.75 0 0 0 1.5 0v-6a.75.75 0 0 0-1.5 0zM14.25 18h6a.75.75 0 0 0 0-1.5h-6a.75.75 0 0 0 0 1.5zM1.5 17.25a6.003 6.003 0 0 1 8.356-5.518.75.75 0 0 0 .588-1.38A7.504 7.504 0 0 0 0 17.25a.75.75 0 0 0 1.5 0zm9.375-12.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0zm1.5 0a4.875 4.875 0 1 0-9.75 0 4.875 4.875 0 0 0 9.75 0z"></path></svg>
                                        <span class="text-secondary">Personal details</span>
                                    </a>
                                </h6>
                            </li>
                            <hr>
                            <li style="${settingOption == 2 ? " text-decoration: underline;" : ""}">
                                <h6>
                                    <a href="customer?do=displayCustomerSecurity">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19.5 16.5v5.25a.75.75 0 0 1-.75.75H5.25a.75.75 0 0 1-.75-.75v-10.5a.75.75 0 0 1 .75-.75h13.5a.75.75 0 0 1 .75.75v5.25zm1.5 0v-5.25A2.25 2.25 0 0 0 18.75 9H5.25A2.25 2.25 0 0 0 3 11.25v10.5A2.25 2.25 0 0 0 5.25 24h13.5A2.25 2.25 0 0 0 21 21.75V16.5zM7.5 9.75V6a4.5 4.5 0 0 1 9 0v3.75a.75.75 0 0 0 1.5 0V6A6 6 0 0 0 6 6v3.75a.75.75 0 0 0 1.5 0zM12 15a1.125 1.125 0 1 0 .004 0h-.006a.75.75 0 0 0 .004 1.5H12a.375.375 0 1 1 0-.75.375.375 0 0 1 0 .75.75.75 0 0 0 0-1.5z"></path></svg>
                                        <span class="text-secondary">Security</span>
                                    </a>
                                </h6>
                            </li>
                            <hr>
                        </ul>

                        <!--                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                                                            <div class="fileupload btn">
                                                                <input class="upload" type="file">
                                                            </div>-->
                        <div class="mt-3">
                            <!--                                        <p class="text-secondary mb-1">Update your information and find out how it's used.</p>
                                                                    <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>
                                                                    <button class="btn btn-primary">Follow</button>
                                                                    <button class="btn btn-outline-primary">Message</button>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
