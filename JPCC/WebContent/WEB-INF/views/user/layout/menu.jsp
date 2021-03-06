<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="navbar navbar-inverse row">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div class="navbar-collapse collapse">
		<!--Menu-->
		<ul class="nav navbar-nav">
			<li><a href="home/index.php"> <span
					class="glyphicon glyphicon-home"> </span> Homepage
								</a></li>
			<li><a href="home/about.php"> <span
					class="glyphicon glyphicon-th-list"></span> About
			</a></li>
			<li><a href="home/contact.php"> <span
					class="glyphicon glyphicon-earphone"></span> Contact
			</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right" >
			
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
					Account <span class="caret"></span> </a>
				<ul class="dropdown-menu">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li><a href="account/login.php"> Login
							</a></li>
							<li><a href="account/forgot.php"> Forgot Password
							</a></li>
							<li><a href="account/register.php"> Register
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="account/logoff.php"> Logoff
							</a></li>
							<li><a href="account/change.php"> Change Password
							</a></li>
							<li><a href="account/edit.php"> Edit Profile
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul></li>
		</ul>
		
	</div>
</div>
