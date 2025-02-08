<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

        <div class="shop__sidebar">
            <div class="sidebar__filter" id="priceFilter">
                <div class="section-title">
                    <h4>Shop by price</h4>
                </div>
                <div class="filter-range-wrap">
                    <fmt:setLocale value="en" />
                    <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                        data-min="0"
                        data-max="<fmt:formatNumber value='${highestPrice}' type='number' maxFractionDigits='2'/>">
                    </div>
                    <div class="range-slider">
                        <div class="price-input">
                            <p>Price:</p>
                            <input type="text" id="minamount">
                            <input type="text" id="maxamount">
                        </div>
                    </div>
                </div>
            </div>
            <div class="sidebar__sizes" id="formatFilter">
                <div class="section-title">
                    <h4>Shop by format</h4>
                </div>
                <div class="size__list">
                    <label for="hardcover">
                        Hardcover
                        <input type="checkbox" id="hardcover" value="Hardcover">
                        <span class="checkmark"></span>
                    </label>
                    <label for="paperback">
                        Paperback
                        <input type="checkbox" id="paperback" value="Paperback">
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>
            <div class="sidebar__sizes" id="sortFilter">
                <div class="section-title">
                    <h4>Sort by price</h4>
                </div>
                <div class="size__list">
                    <label for="unsorted">
                        Unsorted
                        <input type="checkbox" id="unsorted" value="unsorted" checked>
                        <span class="checkmark"></span>
                    </label>
                    <label for="low-to-high">
                        Low to high
                        <input type="checkbox" id="low-to-high" value="low-to-high">
                        <span class="checkmark"></span>
                    </label>
                    <label for="high-to-low">
                        High to low
                        <input type="checkbox" id="high-to-low" value="high-to-low">
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>
            <button id="btnFilter">Filter</button>
        </div>