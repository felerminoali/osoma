<jsp:include page="templates/_header-nothing.jsp"/>
<br/>
<br/>
<div class="container">

    <div>
        <strong>
            <a href="/?page=exams" class="btn btn-success"><i class="fa fa-angle-double-left"
                                                              aria-hidden="true"></i> Cancel            </a>
        </strong>
    </div>

    <div id="login-overlay" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Login</h4>
            </div>
            <div class="modal-body">
                <div class="row">

                    <div class="col-xs-12 col-md-6">
                        <div class="well">
                            <form id="loginForm" method="POST">
                                <div class="form-group">
                                    <label for="login_email"
                                           class="control-label">Username</label>
                                    <div>
                                        <input type="text" class="form-control" id="login_email" name="login_email"
                                               value=""
                                               required="" title="Please enter you username"
                                               placeholder="example@gmail.com">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="login_password"
                                           class="control-label">Password</label>
                                    <input type="password" class="form-control" id="login_password"
                                           name="login_password" value=""
                                           required="" title="Please enter your password">
                                    <span class="help-block"></span>
                                </div>
                                <button type="submit"
                                        class="btn btn-success btn-block">Login</button>
                            </form>
                        </div>
                    </div>

                    <div class="hidden-xs hidden-sm">
                        <div class="col-md-6">
                            <p class="lead">Register now for FREE </p>
                            <ul class="list-unstyled" style="line-height: 2">
                                <li><span class="fa fa-check text-success"></span> It is easy</li>
                                <li><span class="fa fa-check text-success"></span> Fast</li>
                                <li><span class="fa fa-check text-success"></span>  and Free</li>
                            </ul>
                            <p><a href="/?page=register"
                                  class="btn btn-info btn-block">Register now</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>