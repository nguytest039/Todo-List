<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/production-system/css/modules/te-smart/yield.css" />
<link rel="stylesheet" href="/production-system/assets/plugins/daterangepicker/daterangepicker.css" />
<script src="/production-system/assets/plugins/jquery/jquery.min.js"></script>
<script src="/production-system/assets/plugins/daterangepicker/moment.min.js"></script>
<script src="/production-system/assets/plugins/daterangepicker/daterangepicker.js"></script>

<div class="container-fluid">
    <spring:message code="vietnamese" var="vietnamese" />
    <spring:message code="chinese" var="chinese" />
    <spring:message code="english" var="english" />
    <spring:message code="profile" var="profile" />
    <spring:message code="logout" var="logout" />

    <jsp:include page="/WEB-INF/jsp/common/header-dashboard.jsp">
        <jsp:param name="titlePage" value="PRODUCTION OUTPUT OVERVIEW" />
        <jsp:param name="subTitlePage" value="" />
        <jsp:param name="vietnamese" value="<%=pageContext.getAttribute(\"vietnamese\") %>" /> <jsp:param name="chinese"
        value="<%= pageContext.getAttribute(\"chinese\") %>" /> <jsp:param name="english" value="<%=
        pageContext.getAttribute(\"english\") %>" /> <jsp:param name="profile"
        value="<%=pageContext.getAttribute(\"profile\") %>" /> <jsp:param name="logout" value="<%=
        pageContext.getAttribute(\"logout\") %>" />
    </jsp:include>

    <div class="row filter" style="height: 4vh">
        <div class="col-md-12 gap-2 d-flex align-items-center flex-wrap">
            <div class="d-flex align-items-center gap-2 filter-group">
                <label for="customerSelect" class="fw-bold mb-0 label-custom">Customer</label>
                <select name="" id="customerSelect" class="form-control form-control-sm text-warning fw-bold">
                    <option selected>Rhea</option>
                    <option>Amazon</option>
                    <option>Kronos</option>
                </select>
            </div>
        </div>
    </div>

    <div class="container-fluid p-0 content-wrapper fit">
        <div class="row h-100">
            <div class="col-md-12 h-100 component-wrapper">
                <div class="component-item">
                    <label class="component-title">Output Detail</label>
                    <div class="component-body">
                        <div class="table-responsive h-100 mh-100 overflow-auto overflow-y-auto">
                            <table class="table table-sm text-dark fw-bold h-100" id="table-1">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-table" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="title-info">Detail Error</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3 mb-2 align-items-center" style="min-height: 4vh">
                            <div class="col-auto d-flex align-items-center gap-2 mt-2">
                                <label class="filter-label mb-0 label-custom">Model</label>
                                <select class="form-select form-select-sm text-warning px-2" id="model"></select>
                            </div>

                            <div class="col-auto d-flex align-items-center gap-2 mt-2">
                                <label class="filter-label mb-0 label-custom">Date Range</label>
                                <input type="text" id="dateRange" class="form-control w-auto" />
                                <button type="button" class="btn btn-sm btn-primary" id="apply">Apply</button>
                            </div>
                        </div>

                        <div class="table-responsive h-100 mh-100 overflow-auto overflow-y-auto">
                            <table class="table table-sm h-100" id="table-2">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/production-system/js/modules/te-smart/yield.js"></script>
