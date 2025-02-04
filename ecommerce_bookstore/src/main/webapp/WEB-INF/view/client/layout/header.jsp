<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="/"><img src="/resources/client/images/BOOKS PARADISE.png" alt=""
                                style="width: 100px;height: 50px;"></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><a href="/products/FICTION">Fiction</a>
                                <ul class="dropdown">
                                    <li><a href="/products/FICTION/ADVENTURE">Adventure</a></li>
                                    <li><a href="/products/FICTION/BIOGRAPHICAL">Biographical</a></li>
                                    <li><a href="/products/FICTION/CLASSIC-FICTION">Classic Fiction</a></li>
                                </ul>
                            </li>
                            <li><a href="/products/NON-FICTION">Non-fiction</a>
                                <ul class="dropdown">
                                    <li><a href="/products/NON-FICTION/ART-FASHION-PHOTOGRAPHY">Art, Fashion &
                                            Photography</a></li>
                                    <li><a href="/products/NON-FICTION/BUSINESS-FINANCE-LAW">Business, Finance &
                                            Law</a>
                                    </li>
                                    <li><a href="/products/NON-FICTION/BIOGRAPHY-TRUESTORIES">Biography & True
                                            stories</a></li>
                                </ul>
                            </li>
                            <li><a href="/products/CHILDREN'S">Children's</a>
                                <ul class="dropdown">
                                    <li><a href="/products/CHILDREN'S/ACTIVITY">Activity Books</a></li>
                                    <li><a href="/products/CHILDREN'S/BABY-TODDLER">Baby & Toddler</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <c:choose>
                            <c:when test="${not empty pageContext.request.userPrincipal}">
                                <div class="header__right__auth">
                                    Welcome, ${sessionScope.fullName}!
                                    <form action="/logout" method="POST">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button type="submit" style="all: unset; cursor: pointer;"><u>Log
                                                out</u></button>
                                    </form>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="header__right__auth">
                                    <a href="/login">Login</a>
                                    <a href="/register">Register</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <ul class="header__right__widget" style="margin-top: 15px;">
                                <li><span class="icon_search search-switch"></span></li>
                                <li><a href="/cart"><span class="icon_bag_alt"></span>
                                        <div class="tip">2</div>
                                    </a></li>
                                <li><i class="bi bi-receipt-cutoff"></i></li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>