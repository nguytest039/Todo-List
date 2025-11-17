<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<style>
    /* universal */
    body {
        background-color: transparent;
        font-family: Roboto-Medium;
        color: #2f203b;
    }

    hr {
        margin-top: 0px;
    }

    .content-wrapper {
        margin-top: 0px !important;
    }

    /* detail */
    .card {
        border-radius: 14px;
        box-shadow: unset;
        margin-top: 15px;
    }
    .card-body :is(span, b) {
        float: right;
    }

    .main-header {
        background-color: #fff;
        border: none;
    }

    .time_select {
        background-image: linear-gradient(to right, #034e9d, #00c0db);
        color: #FFFFFF !important;
        text-align: center;
        border-radius: 1.5rem;
    }

    .time_select>div,
    .card-detail>div {
        padding-top: .25rem !important;
        padding-bottom: .25rem !important;
    }

    .btn_tool {
        position: absolute;
        top: 0.25rem;
        color: #FFFFFF;
    }

    .btn_tool.float-left {
        left: 0.25rem;
    }

    .btn_tool.float-right {
        right: 0.25rem;
    }

    .card-qty,
    .card-detail {
        background-clip: border-box;
        border: 0 solid #e9f1fc;
        border-radius: .25rem;
        box-shadow: 0 0 1px #e9f1fc, 0 1px 3px #e9f1fc;
        background-color: #fff;
    }

    .card-qty span {
        font-size: 0.65rem;
        color: #343a40;
    }

    .card-qty {
        font-size: 2rem;
        border-right: 1px solid #cccccc;
    }

    .i-after {
        position: absolute;
        right: -0.5rem;
        top: 1.25rem;
        color: #777;
    }

    #tblCalendar>thead>tr>th {
        color: #343a40;
        padding: 0 0.25rem 0.75rem;
    }

    #tblCalendar>tbody>tr>td {
        height: 2.5rem;
        padding: 0.25rem 0.5rem;
        line-height: 1rem;
    }

    .text-null {
        color: #d9dcde !important;
        /* font-style: italic; */
    }

    .text-xs {
        font-size: 10px !important;
    }

    .fs14 {
        font-size: 14px;
    }

    .vertical-border {
        border-right: 1px solid #ececec;
    }

    .hidden {
        opacity: 0 !important;
    }
    nav{
        box-shadow: 0 0 4px -2px black;
    }
</style>

<%
    String menuId = request.getParameter("menuId");
    if (menuId == null) menuId = "";
%>
<jsp:include page="/WEB-INF/jsp/common/icivet/header-page.jsp">
    <jsp:param name="path" value='<%= "/hr-system/mobile?icivetFlag&menuId=" + menuId %>' />
    <jsp:param name="title" value="Chấm Công" />
</jsp:include>

<div class="content-wrapper mb-0">
    <section class="content" style=" min-height: calc(90vh);">
        <div class="container-fluid">
            <div class="row pt-2 pb-1">
                <div class="col-12 p-0">
                    <div class="p-2 text-center border-bottom-0" style="height: 63px;">
                        <h3 class="w-100 text-md d-none" style="line-height: 2rem;">
                            <span> ${empNo} - ${nameUser}</span>
                        </h3>
                        <div class="row time_select d-none">
                            <div class="col-1"><a class="prev-month"><i class="fas fa-chevron-left"></i></a></div>
                            <div class="col-10 month-year">Tháng 11 Năm 2020</div>
                            <div class="col-1"><a class="next-month"><i class="fas fa-chevron-right"></i></a></div>
                        </div>
                        <div class="row">
                            <div class="card my-2 w-100" style="background-color: #3085fe; border-radius: 1.5rem !important;">
                                <div class="row">
                                    <div class="col-12 py-1">
                                        <!-- <a href="/hr-system/mobile" class="btn btn_tool float-left"><i class="fas fa-arrow-left"></i></a> -->
                                        <button class="btn prev-month float-left"><i class="fas fa-chevron-left mr-2 text-white"></i></button>
                                        <span class="month-year text-white" style="line-height: 37px;">Tháng 11 Năm 2020</span>
                                        <button class="btn next-month float-right"><i class="fas fa-chevron-right ml-2 text-white"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card my-3 p-2">
                        <div class="row mx-0 text-center">
                            <div class="col col-2-5 p-0 vertical-border">
                                <div class=" text-success text-lg" id="txtNormal">0</div>
                                <span class="text-xs">Bình thường</span>
                            </div>
                            <div class="col col-2-5 p-0 vertical-border">
                                <div class=" text-orange text-lg" id="txtWeirdo">0</div>
                                <span class="text-xs">Bất thường</span>
                            </div>
                            <div class="col col-2-5 p-0 vertical-border">
                                <div class=" text-primary text-lg" id="txtTakeLeave">0</div>
                                <span class="text-xs">Nghỉ phép năm</span>
                            </div>
                            <div class="col col-2-5 p-0 vertical-border">
                                <div class=" text-danger text-lg" id="txtFreeBreak">0</div>
                                <span class="text-xs">Nghỉ tự do</span>
                            </div>
                            <div class="col col-2-5 p-0">
                                <div class=" text-gray border-0 text-lg" id="txtAlternate">0</div>
                                <span class="text-xs">Luân phiên</span>
                            </div>
                        </div>
                    </div>
                    <div class="card my-1 p-2">
                        <!-- <div class="row mx-0 mt-2 ">
                            <div class="col-9 text-dark fs14">Số phép đã sử dụng trong năm</div>
                            <div class="col-3 text-right text-primary"><span class="txtTotalF">0</span></div>
                        </div>
                        <hr> -->
                        <div class="row mx-0 mt-1 work-shift-wrapper">
                            <div class="col-4 text-dark fs14">Ca làm việc</div>
                            <div class="col-8 text-right text-primary" style="font-size: 14px !important;"><span id="lb_work_shift" onclick="showShift()">--</span></div>
                        </div>
                        <hr>
                        <div class="row mx-0 mt-1">
                            <div class="col-9 text-dark fs14">Tổng số ngày công</div>
                            <div class="col-3 text-right text-primary"><span class="txtTotalW">0</span></div>
                        </div>
                        <hr>
                        <!-- <div class="row mx-0 mt-1 ">
                            <div class="col-7 text-dark fs14">Tiền cơm đã bị trừ</div>
                            <div class="col-5 text-right text-primary"><span class="txtTotalM">0 VNĐ</span></div>
                        </div>
                        <hr> -->
                        <div class="row mx-0 mt-1">
                            <div class="col-9 text-dark fs14">Số giờ trợ cấp ca đêm</div>
                            <div class="col-3 text-right text-primary"><span class="txtTotalOT3">0</span></div>
                        </div>
                        <hr>
                        <div class="row mx-0 mt-1">
                            <div class="col-9 text-dark fs14">Số giờ tăng ca</div>
                            <div class="col-3 text-right text-primary"><span class="txtTotalOT">0</span></div>
                        </div>
                        <hr>
                        <div class="row mx-0 mt-1">
                            <div class="col-9 text-dark fs14">Số lần đi muộn về sớm</div>
                            <div class="col-3 text-right text-primary"><span class="txtTotalAbnormal">0</span></div>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>

        <div class="row p-2 mx-0 mt-1 card" style="background-color: #e9f1fc;">
            <div class="col-12 p-0">
                <table id="tblCalendar" class="table no-border text-center m-0" style="font-size: 14px ;">
                    <thead>
                        <tr>
                            <th>CN</th>
                            <th>T2</th>
                            <th>T3</th>
                            <th>T4</th>
                            <th>T5</th>
                            <th>T6</th>
                            <th>T7</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>

        <div class="row mx-0 mb-2">
            <label class="col-9 font-weight-lighter text-primary fs14 mb-0" id="check_label" onclick="showSymbol()"><i class="fa fa-info-circle"></i> Bảng ký hiệu chấm công</label>
        </div>
        <div class="row mt-3 mb-5">
            <div class="col-sm-12" style="font-size: 14px;">
                <p class="text-danger mb-1">*Lưu ý: Hệ thống sẽ tự động cập nhật dữ liệu trong vòng 24 giờ kể từ khi chủ quản ký duyệt.</p>
                <p class="text-primary mb-1 pl-3">- Chốt công lần 1: từ ngày 1~20 <br>Hoàn thành ký duyệt trước <span id="txt_sync_start_time">--:--:--</span></p>
                <p class="text-primary mb-2 pl-3">- Chốt công lần 2: từ ngày 21~31 <br>Hoàn thành ký duyệt trước <span id="txt_sync_end_time">--:--:--</span></p>
                <p class="text-danger mb-2">Nếu có bất kỳ thắc mắc nào xin vui lòng liên hệ trợ lý để được giải đáp!</p>
                <!-- <p class="mb-0 text-sm">Phát triển bởi <b>VN FII-Software Team</b></p> -->
            </div>
        </div>


        <div class="modal fade" id="modal-infor">
            <div class="modal-dialog modal-sm" style="margin: auto; margin-top: 40%; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header py-1"
                        style="background-color: #3083fe; color: #FFFFFF !important; text-align: center; border: 0;">
                        <span class="lb_work_date"></span> <span class="lb_work_shift_time"></span>
                    </div>
                    <div class="modal-body py-0">
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-sm m-0">
                                    <tr>
                                        <td colspan="2" class="text-center"><span class="lb_w_result"></span> - <span class="lb_edited"></span></td>
                                    </tr>
                                    <tr>
                                        <td>Vào làm</td>
                                        <td class="text-right"><a class="float-right begin_work"></a></td>
                                    </tr>
                                    <tr>
                                        <td>Nghỉ đi ăn</td>
                                        <td class="text-right"><a class="float-right begin_rest"></a></td>
                                    </tr>
                                    <tr>
                                        <td>Vào làm</td>
                                        <td class="text-right"><a class="float-right end_rest"></a></td>
                                    </tr>
                                    <tr>
                                        <td>Tan ca</td>
                                        <td class="text-right"><a class="float-right end_work"></a></td>
                                    </tr>
                                    <tr>
                                        <td>Tăng ca từ</td>
                                        <td class="text-right"><a class="float-right begin_ot"></a></td>
                                    </tr>
                                    <tr>
                                        <td>Tăng ca đến</td>
                                        <td class="text-right"><a class="float-right end_ot"></a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="text-center"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer p-2">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" onclick="this.blur()">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-symbol">
            <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable " style="margin: auto; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header py-1" style="background-color: #3083fe; color: #FFFFFF !important; text-align: center; border: 0;">
                        <span>Bảng ký hiệu chấm công</span>
                    </div>
                    <div class="modal-body fs14">
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered align-middle">
                                <tbody>
                                <tr><td class="text-danger">1</td><td><spring:message code="time-keeping.1" /></td></tr>
                                <tr><td>F</td><td><spring:message code="time-keeping.f" /></td></tr>
                                <tr><td>O</td><td><spring:message code="time-keeping.0" /></td></tr>
                                <tr><td>LV</td><td><spring:message code="time-keeping.lv" /></td></tr>
                                <tr><td class="text-danger">N</td><td><spring:message code="time-keeping.n" /></td></tr>
                                <tr><td>BL</td><td><spring:message code="time-keeping.bl" /></td></tr>
                                <tr><td>KT</td><td><spring:message code="time-keeping.kt" /></td></tr>
                                <tr><td><span>LP</span></td><td><spring:message code="time-keeping.lp" /></td></tr>
                                <tr><td>D</td><td><spring:message code="time-keeping.d" /></td></tr>
                                <tr><td>H</td><td><spring:message code="time-keeping.h" /></td></tr>
                                <tr><td>CT</td><td><spring:message code="time-keeping.ct" /></td></tr>
                                <tr><td>LC</td><td><spring:message code="time-keeping.lc" /></td></tr>
                                <tr><td>G</td><td><spring:message code="time-keeping.g" /></td></tr>
                                <tr><td>T</td><td><spring:message code="time-keeping.t" /></td></tr>
                                <tr><td>V1</td><td><spring:message code="time-keeping.v1" /></td></tr>
                                <tr><td>V</td><td><spring:message code="time-keeping.v" /></td></tr>
                                <tr><td>TS</td><td><spring:message code="time-keeping.ts" /></td></tr>
                                <tr><td>C</td><td><spring:message code="time-keeping.c" /></td></tr>
                                <tr><td>TV</td><td><spring:message code="time-keeping.tv" /></td></tr>
                                </tbody>
                            </table>
                        </div>
                        <p><span class="text-bold text-danger">Chú ý: </span><spring:message code="time-keeping.note-title"></spring:message></p>
                    </div>
                    <div class="modal-footer p-2">
                        <button type="button" id="closeSymbol" class="btn btn-default btn-sm" data-dismiss="modal" onclick="this.blur()">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-shift">
            <div class="modal-dialog modal-sm" style="margin: auto; margin-top: 40%; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header py-1"
                        style="background-color: #3083fe; color: #FFFFFF !important; text-align: center; border: 0;">
                        <span class="">Chi Tiết Ca (<span class="shift_detail"></span>)</span>
                    </div>
                    <div class="modal-body py-0">
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-sm m-0">
                                        <tr><td class="d-flex justify-content-between"><span>Giờ vào ca </span> <span id="bWork"></span></td></tr>
                                        <tr><td class="d-flex justify-content-between"><span>Giờ tan ca </span> <span id="eWork"></span></td></tr>
                                        <tr><td class="d-flex justify-content-between"><span>Giờ ăn (phút)  </span><span id="lunch_dinner"></span></td></tr>
                                        <tr><td class="d-flex justify-content-between"><span id="bOt_title">Giờ bắt đầu tăng ca </span> <span id="bOt"></span></td></tr>
                                </table>
                            </div>
                            <div class="col-12" id="note_modal">
                                <p class="text-danger mb-2" id="modal_note_2" style="display: none;">
                                    Thời gian nghỉ ngơi (<span class="lunch_break"></span>): Người lao động được nghỉ <span id="lunch_time"></span> phút theo đơn vị sắp xếp.
                                </p>
                                <p class="text-danger mb-0" id="modal_note" style="display: none;">
                                    Trường hợp tăng ca không liền ca (<span class="evening"></span>): Người lao động được nghỉ ngơi <span id="dinner_time"></span> phút theo đơn vị sắp xếp.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer p-2">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" onclick="this.blur()">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
</section>
<aside class="control-sidebar control-sidebar-light"></aside>
<footer class="main-footer bg-grey py-2 text-sm" style="line-height: 0.5rem; background-color: #EDF6FF;">
    <div class="d-inline-block w-100 text-right">
        <strong>© 2020. <span href="#" title="cpe-vn-fii-sw@mail.foxconn.com">FII-SW Team</span></strong>
    </div>
</footer>
</div>

<script>
    var dataset = {
        empNo: '${empNo}',
        // empNo: 'V0957226',
        idUser: '${idUser}',
        userName: '${nameUser}',
        idRole: '${idRoles}',
        roleName: '${nameRole}',
        shift: '${shift_user}',
        line: '${line}',
        department: '${department}',
        idDepartment: '${idDepartment}',
        deptCode: '${dept_code}'
    };
    var current;
    var shiftCache = {}; // key: classNo -> detail object
    var lastDayClassNo = null;

    var work_type = {
        // 'P': 'Nghỉ việc hưởng 950000/ tháng',
        // '1': 'Nghỉ việc riêng có xin phép',
        // 'F': 'Ngày nghỉ phép được hưởng lương (1 tháng = 1 ngày phép)',
        // '0': 'Nghỉ ốm, thai sản hưởng BHXH',
        // 'TS': 'Nghỉ thai sản',
        // 'LV': 'Ngày làm việc đủ công',
        // 'N': 'Nghỉ việc riêng không xin phép (nghỉ vô kỷ luật)',
        // 'V': 'Ngày nghỉ được hưởng lương (theo quy định của PL Việt Nam)',
        // 'B': 'Ngày nghỉ bù được hưởng lương（Nghỉ bù ít nhất là 0.5 ngày)',
        // 'BL': 'Ngày nghỉ do trùng với ngày lễ, tết hay trùng với ngày nghỉ luân phiên',
        // 'K': 'Ngày nghỉ được hưởng 70% lương (có thoả thuận giữa NLĐ và người sử dụng LĐ)',
        // 'H': 'Ngày nghỉ do công ty hết việc được hưởng lương',
        // 'T': 'Nghỉ việc riêng đặc biệt',
        // 'TV': 'Nghỉ thôi việc',
        // 'A': 'Nghỉ lưu chức ngừng lương',
        // 'CT': 'Ngày đi học, công tác có hưởng lương',
        // 'LP': 'Nghỉ luân phiên',
        // 'D': 'Ngày nghỉ chuyển ca (1 tháng chỉ được nghỉ 1 ngày)',
        // 'BT': 'Nghỉ bù thai sản',
        // 'KT': 'Khám thai',
        // 'Ca 3': 'Số giờ làm ca 3 trong ngày (quy định từ 22h00 đến 06h00 ngày hôm sau)',
        // 'ND': 'Chưa có dữ liệu',

        '1': 'Nghỉ việc riêng có xin phép',
        'F': 'Ngày nghỉ phép được hưởng lương (1 tháng = 1 ngày phép)',
        'O': 'Nghỉ ốm',
        'LV': 'Làm việc bình thường',
        'N': 'Nghỉ tự do',
        'BL': 'Nghỉ bù luân phiên',
        'KT': 'Nghỉ khám thai',
        'LP': 'Nghỉ luân phiên',
        'D': 'Nghỉ đổi ca',
        'H': 'Nghỉ ngừng sản xuất',
        'CT': 'Nghỉ Công tác',
        'LC': 'Nghỉ lưu chức ngừng lương',
        'G': 'Nghỉ tai nạn lao động',
        'T': 'Nghỉ việc riêng đặc biệt',
        'V1': 'Kết hôn 1 ngày,nghỉ tang 1 ngày',
        'V': 'Nghỉ cưới, nghỉ tang, nghỉ lễ tết',
        'TS': 'Nghỉ thai sản',
        'C': 'Số ngày chưa vào làm việc trong tháng',
        'TV': 'Ngày nghỉ việc trong tháng',
        'Ca 3': 'Số giờ làm ca 3 trong ngày (quy định từ 22h00 đến 06h00 ngày hôm sau)',
        'ND': 'Chưa có dữ liệu',
    }

    var calcF = {
        "F1": 0.125,
        "F2": 0.25,
        "F3": 0.375,
        "F3.5": 0.4375,
        "F4": 0.5,
        "F4.5": 0.5625,
        "F5": 0.625,
        "F5.5": 0.6875,
        "F6": 0.75,
        "F6.5": 0.8125,
        "F7": 0.875,
        "F7.5": 0.9375,
        "F": 1,
        "F/2": 0.5,
        "F/BL": 0.5,
        "BL/F": 0.5

    }

    function init() {
        loadData();
        getTimeSync();
        // window.sessionStorage.setItem("dataLink", JSON.stringify(dataset));
    }

    function loadData() {
        $('.loader').removeClass('d-none');
        $('.month-year').html("Tháng " + dataset.month + " Năm " + dataset.year);
        $.ajax({
            type: 'GET',
            // url: '/hr-system/api/oppm/workcount',
            url: '/hr-system/api/hr/vn/monthly/workcount',
            // url:'/hr-system/assets/json/data_workcount.json',
            data: {
                cardId: dataset.empNo,
                month: dataset.month,
                year: dataset.year,
                deptCode: '',
            },
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (!$.isEmptyObject(result)) {
                    if (!$.isEmptyObject(result.data)) {
                        var data = result.data[dataset.empNo];

                        $('#txtNormal').html(convertNumberFixed(data.totalCountResult.LV));
                        // $('#txtWeirdo').html(data.totalCountResult.LV);
                        $('#txtWeirdo').html('0');
                        // $('#txtTakeLeave').html(convertNumberFixed(data.totalCountResult.F));
                        $('#txtFreeBreak').html(convertNumberFixed(data.totalCountResult.N));
                        $('#txtAlternate').html(convertNumberFixed(data.totalCountResult.LP));

                        $('.txtTotalF').html(convertNumberFixed(data.usedFreeDuty));
                        // $('.txtTotalW').html(convertNumberFixed(data.totalCountResult.LV + data.totalCountResult.F));
                        $('.txtTotalM').html((data.totalMeal != 0 ? data.totalMeal + ' 000 VNĐ' : '0 VNĐ'));
                        // $('.txtTotalOT').html(data.normalOtTotal);
                        // $('.txtTotalOT3').html(data.ca3OtTotal);
                        $('.txtTotalAbnormal').html(data.earlyLateCount);

                        var totalDays = result.dayOfMonth.length;
                        var firstDay = convertDayToNum(result.dayOfWeek[0]);

                        var day_tmp = new Date(dataset.year + '/' + dataset.month + '/01');
                        var day = day_tmp.getDay();
                        var date = day_tmp.getDate();

                        var tbody_html = "";
                        var td_class = "";
                        var weekday_count = 1;
                        var tr_count = 1;
                        var td_count = 1;
                        var offset_td = 0;
                        var counter = 1;
                        while (counter <= totalDays) {
                            if (weekday_count === 8) {
                                tbody_html += "</tr>";
                                weekday_count = 1;
                            }
                            if (weekday_count === 1) {
                                tbody_html += "<tr>";
                                tr_count++;
                            }
                            // prepend blank tds
                            while (offset_td < firstDay) {
                                tbody_html += "<td class='empty'></td>";
                                offset_td++;
                                weekday_count++;
                                td_count++;
                            }

                            td_class = "day_" + counter;
                            tbody_html += "<td class='" + td_class + "'>" + counter + "</td>";
                            counter++;
                            weekday_count++;
                            td_count++;
                        }
                        // append blank tds
                        while ((td_count - 1) < (tr_count - 1) * 7) {
                            tbody_html += "<td class='empty'></td>";
                            td_count++;
                        }
                        $('#tblCalendar>tbody').html(tbody_html);


                        var totalOverTime = 0, totalOverTimeShift3 = 0;
                        var totalWorkShift3 = 0;
                        var totalF = 0, totalLV = 0;

                        var preloadRequests = [];
                        var uniqueClassNos = {};
                        var lastDayShiftText = null;
                        // var lastDayClassNo = null;
                        for (i in data.workResultList) {
                            var index = Number(i) + 1;
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-day', data.workResultList[i].workDate ? data.workResultList[i].workDate.replace(/(\d{4})(\d{2})(\d{2})/, "$1/$2/$3"):"");
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-shift', data.workResultList[i].classNo + ' (' + data.workResultList[i].shift + ')');
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-classno', data.workResultList[i].classNo);
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-b_work', fixNull(data.workResultList[i].beginWork?.split(" ")[1]));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-b_rest', fixNull(data.workResultList[i].beginRest?.split(" ")[1]));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-e_work', fixNull(data.workResultList[i].endWork?.split(" ")[1]));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-e_rest', fixNull(data.workResultList[i].endRest?.split(" ")[1]));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-b_ot', fixNull(data.workResultList[i].beginOvertime?.split(" ")[1]));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-e_ot', fixNull(data.workResultList[i].endOvertime?.split(" ")[1]));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-edited', (data.workResultList[i].resultModify));
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-w_result', data.workResultList[i].resultShort);
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-ot_count', data.workResultList[i].actualOvertimeCount);
                            $('#tblCalendar>tbody>tr>td.day_' + index).attr('data-ot_status', data.workResultList[i].actualOvertimeSignStatus);
                            // $('#tblCalendar>tbody>tr>td.day_' + index).append('<br>' + fixNull(data.workResultList[i].resultShort));

                            $('#tblCalendar>tbody>tr>td.day_' + index).append('</br><span class="text-xs">' + fixNull(data.workResultList[i].resultShort) + '</span>')

                            if (data.workResultList[i].actualOvertimeCount) {
                                const workDate = data.workResultList[i].workDate;
                                const otStatus = data.workResultList[i].actualOvertimeSignStatus;

                                const dayStr = workDate.replace(/(\d{4})(\d{2})(\d{2})/, '$1/$2/$3');
                                const cutOff = '2025/11/01';

                                if ( new Date(dayStr) - new Date(cutOff) < 0 ) {
                                    $('#tblCalendar>tbody>tr>td.day_' + index + ' span.text-xs')
                                        .append('<span style="color:#E39301"></br><i class="far fa-clock"></i> '
                                        + data.workResultList[i].actualOvertimeCount + 'H</span>');
                                }
                                else if (otStatus === "通过") {
                                    $('#tblCalendar>tbody>tr>td.day_' + index + ' span.text-xs')
                                        .append('<span style="color:#E39301"></br><i class="far fa-clock"></i> '
                                        + data.workResultList[i].actualOvertimeCount + 'H</span>');
                                }
                            }

                            if (data.workResultList[i].resultShort == 'LP') {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-danger');
                            }
                            else if (data.workResultList[i].resultShort == 'LV') {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-success');
                                $('#tblCalendar>tbody>tr>td.day_' + index).attr('onclick', 'showInfor(this)');
                                // clicking a cell also updates header shift
                                $('#tblCalendar>tbody>tr>td.day_' + index).on('click', function() {
                                    updateShift(this);
                                });

                            }
                            else if (data.workResultList[i].resultShort == 'F') {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-primary');
                                // var badge = '</br><span class="badge">' + data.workResultList[i].resultShort + '</span>';
                                // $('#tblCalendar>tbody>tr>td.day_' + index).append(badge);
                                $('#tblCalendar>tbody>tr>td.day_' + index).attr('onclick', 'showInfor(this)');
                                $('#tblCalendar>tbody>tr>td.day_' + index).on('click', function() {
                                    updateShift(this);
                                });
                            }
                            else if (data.workResultList[i].resultShort == 'N') {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-danger');
                                $('#tblCalendar>tbody>tr>td.day_' + index).attr('onclick', 'showInfor(this)');
                                $('#tblCalendar>tbody>tr>td.day_' + index).on('click', function() {
                                    updateShift(this);
                                });
                            }
                            else if (!isNaN(Number(data.workResultList[i].resultShort)) && data.workResultList[i].resultShort != null) {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-warning');
                                $('#tblCalendar>tbody>tr>td.day_' + index).attr('onclick', 'showInfor(this)');
                                $('#tblCalendar>tbody>tr>td.day_' + index).on('click', function() {
                                    updateShift(this);
                                });
                            }
                            else if (data.workResultList[i].resultShort == 'NULL' || data.workResultList[i].resultShort == null) {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-null');
                            }
                            else {
                                $('#tblCalendar>tbody>tr>td.day_' + index).addClass('text-primary');
                                // var badge = '</br><span class="badge">' + convertNumberFixed(data.workResultList[i].resultShort) + '</span>';
                                // $('#tblCalendar>tbody>tr>td.day_' + index).append(badge);
                                $('#tblCalendar>tbody>tr>td.day_' + index).attr('onclick', 'showInfor(this)');
                                $('#tblCalendar>tbody>tr>td.day_' + index).on('click', function() {
                                    updateShift(this);
                                });
                            }

                            totalOverTime += data.workResultList[i].actualOvertimeCount;
                            totalOverTimeShift3 += data.workResultList[i].overtimeShift3;
                            totalWorkShift3 += data.workResultList[i].shift3Time; //Total shift 3 time

                            if(calcF[data.workResultList[i].resultShort] != undefined) {
                                totalF += calcF[data.workResultList[i].resultShort];
                                totalLV += (1 - calcF[data.workResultList[i].resultShort]);
                            }

                            // Preload shift detail 
                            var classNo = data.workResultList[i].classNo;
                            if (classNo && !uniqueClassNos[classNo] && !shiftCache[classNo]) {
                                uniqueClassNos[classNo] = true;
                                preloadRequests.push(
                                    loadShift(classNo).done(function(res){
                                        var payload = res && res.result ? res.result : res;
                                        var detail = Array.isArray(payload) ? (payload && payload[0] ? payload[0] : null) : payload;
                                        if (detail && (detail.classNo || detail.classno)) {
                                            var key = detail.classNo || detail.classno;
                                            shiftCache[key] = detail;
                                        }
                                    })
                                );
                            }

                            // capture last available day shift for header display
                            if (data.workResultList[i].classNo) {
                                lastDayClassNo = data.workResultList[i].classNo;
                                lastDayShiftText = data.workResultList[i].classNo + ' (' + data.workResultList[i].shift + ')';
                            }
                        }
                        $('.txtTotalOT').html(totalOverTime + totalOverTimeShift3);
                        $('.txtTotalOT3').html(totalWorkShift3);

                        $('#txtTakeLeave').html(convertNumberFixed(data.totalCountResult.F));
                        $('.txtTotalW').html(convertNumberFixed(data.totalCountResult.LV + data.totalCountResult.F + data.totalCountResult.V));

                    if (lastDayClassNo) {
                        loadShift(lastDayClassNo).done(function(res){
                            var payload = res && res.result ? res.result : res;
                            var detail = Array.isArray(payload) ? (payload && payload[0] ? payload[0] : null) : payload;
                            shiftCache[lastDayClassNo] = detail;

                            if (detail) {
                                var code = detail.shiftCode || lastDayClassNo;
                                var beginWork = detail.beginWork || '';
                                var endWork = detail.endWork || '';
                                var bw = beginWork.slice ? beginWork.slice(0,5) : '';
                                var ew = endWork.slice ? endWork.slice(0,5) : '';

                                if (bw && ew) {
                                    $('#lb_work_shift').text(code + ' (' + bw + ' - ' + ew + ')');
                                } else {
                                    $('#lb_work_shift').text(code);
                                }
                                
                                $('.shift_detail').text(code);
                            } else {
                                $('#lb_work_shift').text(lastDayShiftText || '--');
                                $('.shift_detail').text('--');
                            }
                        }).fail(function(){
                            $('#lb_work_shift').text(lastDayShiftText || '--');
                            $('.shift_detail').text('--');
                        });
                    }

                        if (preloadRequests.length > 0) {
                            $.when.apply($, preloadRequests).always(function(){ /* preload complete */ });
                        }

                    } else {
                        swal('NO DATA!', '', 'error');
                        $('#txtNormal').html(0);
                        $('#txtWeirdo').html('0');
                        $('#txtTakeLeave').html(0);
                        $('#txtFreeBreak').html(0);
                        $('#txtAlternate').html(0);

                        $('.txtTotalF').html(0);
                        $('.txtTotalW').html(0);
                        $('.txtTotalM').html('0 VNĐ');
                        $('.txtTotalOT').html(0);
                        $('.txtTotalOT3').html(0);
                        $('.txtTotalAbnormal').html(0);
                    }
                }
            },
            error: function () {
                swal('ERROR!', 'FAIL!', 'error');
            },
            complete: function () {
                $('.loader').addClass('d-none');
            }
        });
    }

    function convertDayToNum(str) {
        var res = 0;
        for (var i = 2; i <= 7; i++) {
            if (str == 'T' + i) {
                res = i - 1;
            }
        }
        return res;
    }

    function convertNumberFixed(num) {
        var res = 0;
        if (num != undefined && num != null) {
            res = parseFloat(num.toFixed(2));
        }
        return res;
    }

    function showSymbol(){
        $('#modal-symbol').modal('show');
    }

    function showShift(){
        let $shiftbody = $('#modal-shift tbody');
        $shiftbody.find(".extra-row").remove();
        $('#modal-shift').modal('show');
        
        if (lastDayClassNo) {
            var cached = shiftCache[lastDayClassNo];
            if (cached) {
                renderShiftRows($shiftbody, cached);
            } else {
            loadShift(lastDayClassNo)
                .done(function(res){
                    $shiftbody.find(".extra-row").remove();
                    var payload = res && res.result ? res.result : res;
                    var detail = Array.isArray(payload) ? (payload && payload[0] ? payload[0] : null) : payload;
                    if (!detail) {

                        return;
                    }
                    shiftCache[lastDayClassNo] = detail;
                    renderShiftRows($shiftbody, detail);
                })
            }
        }
        // dong ghi chu khi co ghi chu
        if (($('#modal_note').css('display') !== 'none' || $('#modal_note_2').css('display') !== 'none') && !$('#note_modal .note-label').length) {
            $('#note_modal').prepend('<p class="note-label text-danger text-start mb-0" style="text-decoration:underline">Ghi chú:</p>');
        }
    }
    
    function showInfor(context) {
        let $tbody = $("#modal-infor tbody");
        let $shiftbody = $('#modal-shift tbody')
        $tbody.find(".extra-row").remove();

        $('#modal-infor').modal('show');
        var data = context.dataset;
        $('.lb_work_date').html(data.day);
        $('.lb_work_shift').html(data.shift);
        $('.begin_work').html(data.b_work);
        $('.begin_rest').html(data.b_rest);
        $('.end_work').html(data.e_work);
        $('.end_rest').html(data.e_rest);
        $('.begin_ot').html(data.b_ot);
        $('.end_ot').html(data.e_ot);
        $('.lb_edited').html(data.edited);
        $('.ot_status').html(data.ot_status);

        if (data.ot_count > 0) {
            let statusText, statusClass;
            if (data.ot_status === "等待簽核") {
                statusText = "Chờ ký duyệt";
                statusClass = "text-warning";
            } else if (data.ot_status === "通過") {
                statusText = "Đã Duyệt";
                statusClass = "text-success";
            } else if (data.ot_status === "駁回") {
                statusText = "Hủy Bỏ";
                statusClass = "text-danger";
            } else {
                statusText = ""
            }
            
            if(statusText){
                $tbody.find("tr:last").before(
                    "<tr class='extra-row " + statusClass + " text-center'><td colspan='2'>" 
                    + statusText + " (" + data.ot_count + "H)</td></tr>"
                );
            }
        }
        if (data.w_result == 'LV') {
            $('.lb_w_result').html('<span class="text-success">LV</span>');
        } else if (data.w_result.indexOf('LV') != -1) {
            var tmp = data.w_result.replace('LV/', '');
            $('.lb_w_result').html('<span class="text-primary">' + (work_type[tmp] || tmp) + '</span>');
        } else if (data.w_result == 'N') {
            $('.lb_w_result').html('<span class="text-danger">Nghỉ tự do</span>');
        } else {
            $('.lb_w_result').html('<span class="text-primary">' + (work_type[data.w_result] || data.w_result) + '</span>');
        }

        var classNo = data.classno;
        $shiftbody.find(".extra-row").remove();

        if (classNo) {
            var cached = shiftCache[classNo];
            if (cached) {
                renderShiftRows($shiftbody, cached);
            } else {
                loadShift(classNo)
                    .done(function(res) {
                        var payload = res && res.result ? res.result : res;
                        var detail = Array.isArray(payload) ? (payload && payload[0] ? payload[0] : null) : payload;
                        if (!detail) {
                            var el = document.querySelector('.lb_work_shift_time');
                            if (el) el.textContent = '';
                            return;
                        }
                        shiftCache[classNo] = detail;
                        renderShiftRows($shiftbody, detail);
                    })
                    .fail(function() {
                        var el = document.querySelector('.lb_work_shift_time');
                        if (el) el.textContent = '';
                    });
            }
        } else {
            var el = document.querySelector('.lb_work_shift_time');
            if (el) el.textContent = '';
        }
    }

    function renderShiftRows($shiftbody, detail) {
        $shiftbody.find(".extra-row").remove();
        
        var beginWork = detail.beginWork;
        var endWork = detail.endWork;
        var beginRest = detail.beginRest;
        var endRest = detail.endRest;
        var beginOT = detail.beginOverTime || detail.beginOT;
        var lunchTime = detail.lunchTime;
        var dinnerTime = detail.dinnerTime;

        var toMinutes = (t) => {
            if (!t) return 0;
            if (typeof t !== 'string') t = String(t);
            if (!t.includes(':')) return 0;
            var p = t.split(':').map(Number);
            return (p[0] || 0) * 60 + (p[1] || 0);
        };
        
        var isOffice = false;
        if (beginRest && endRest && lunchTime) {
            let begin = toMinutes(beginRest);
            let end = toMinutes(endRest);
            if (end < begin) end += 24 * 60;

            const restGap = end - begin;
            if (restGap === lunchTime) isOffice = true;

            $('.lunch_break').html(beginRest.slice(0,5) + ' - ' + endRest.slice(0,5));
            $('#lunch_time').html(lunchTime);
        }

        if (beginOT) {
            var parts = beginOT.split(':');
            var hour = parseInt(parts[0]);
            var endHour = (hour + 3) % 24;
            var endTime = (endHour < 10 ? '0' : '') + endHour + ':' + parts[1] + ':' + (parts[2] || '00');
            $('.evening').html(beginOT.slice(0,5) + ' - ' + endTime.slice(0,5));
            $('#dinner_time').html(dinnerTime);
        }

        if (isOffice) {
            $('#bOt').html(beginOT);
            $('#bOt, #bOt_title').show();
            $('#modal_note').hide();
            $('#modal_note_2').hide();
        } else {
            $('#bOt, #bOt_title').hide();
            $('#modal_note_2').show();
            if (!beginOT || (endWork === beginOT && dinnerTime == 0)) {
                $('#modal_note').hide();
            } else {
                $('#modal_note').show();
            }
        }
        
        if (beginWork) $('#bWork').html(beginWork);
        if (endWork) $('#eWork').html(endWork);
        if (detail.lunchTime) $('#lunch_dinner').html(detail.lunchTime);

        var shiftCode = detail.shiftCode || detail.classNo || '';
        var bw = (beginWork && beginWork.slice) ? beginWork.slice(0,5) : '';
        var ew = (endWork && endWork.slice) ? endWork.slice(0,5) : '';
        
        if (shiftCode) {
            if (bw && ew) {
                $('#lb_work_shift').text(shiftCode + ' (' + bw + ' - ' + ew + ')');
            } else {
                $('#lb_work_shift').text(shiftCode);
            }
        }
        $('.lb_work_shift_time').text(`\${detail.shiftCode} (\${beginWork.slice(0,5)} - \${endWork.slice(0,5)})`);
    }

    function updateShift(el) {
        if (!el) return;
        var cls = el.dataset.classno;
        var detail = cls ? shiftCache[cls] : null;
        if (detail && detail.shiftSectionEn) {
            var code = detail.shiftCode || cls;
            $('#lb_work_shift').text(code + ' (' + detail.beginWork.slice(0,5) + ' - ' + detail.endWork.slice(0,5) + ')');

        } else if (el.dataset.shift) {
            $('#lb_work_shift').text(el.dataset.shift);
        } else {
            $('#lb_work_shift').text('--');
        }
    }

    function loadShift(classNo) {
        return $.ajax({
            type: 'GET',
            url: '/hr-system/api/hr/vn/monthly/class',
            // url: '/hr-system/assets/json/gw-yte nn3.json',
            data: {
                classNo: classNo
            },
            contentType: 'application/json; charset=utf-8'
        });
    }

    $('.prev-month').click(function () {
        if (dataset.month == 1) {
            dataset.month = 12;
            dataset.year--;
        } else {
            dataset.month--;
        }
        loadData();

        var month = current.getMonth() + 1;
        var year = current.getFullYear();
        if (dataset.year == year && dataset.month == month) {
            $('.next-month').attr('disabled', 'disabled');
            $('.next-month').addClass('hidden');

        } else {
            $('.next-month').removeAttr('disabled');
            $('.next-month').removeClass('hidden');
        }
        if (dataset.year == (year - 1) && dataset.month == 1) {
            $('.prev-month').attr('disabled', 'disabled');
            $('.prev-month').addClass('hidden');
        } else {
            $('.prev-month').removeAttr('disabled');
            $('.prev-month').removeClass('hidden');
        }
    });

    $('.next-month').click(function () {
        if (dataset.month == 12) {
            dataset.month = 1;
            dataset.year++;
        } else {
            dataset.month++;
        }
        loadData();

        var month = current.getMonth() + 1;
        var year = current.getFullYear();
        if (dataset.year == year && dataset.month == month) {
            $('.next-month').attr('disabled', 'disabled');
            $('.next-month').addClass('hidden');

        } else {
            $('.next-month').removeAttr('disabled');
            $('.next-month').removeClass('hidden');
        }
        if (dataset.year == (year - 1) && dataset.month == 1) {
            $('.prev-month').attr('disabled', 'disabled');
            $('.prev-month').addClass('hidden');

        } else {
            $('.prev-month').removeAttr('disabled');
            $('.prev-month').removeClass('hidden');

        }
    });

    function getTimeSync() {
        $.ajax({
            type: "GET",
            url: "/hr-system/api/workcount/assistant/import",
            contentType: "application/json; charset=utf-8",
            success: function (res) {
                if(res.code == 'SUCCESS') {
                    var data = res.data;
                    $('#txt_sync_start_time').html(data[0].syncEndTime);
                    $('#txt_sync_end_time').html(data[1].syncEndTime);
                }
            },
            error: function (errMsg) {
                console.log(errMsg);
            }
        });
    }

    function getTimeNow() {
        $.ajax({
            type: "GET",
            url: "/hr-system/api/oppm/vn/time/now",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                current = new Date(data);
                var month = current.getMonth() + 1;
                var year = current.getFullYear();
                dataset.month = month;
                dataset.year = year;
                init();
            },
            failure: function (errMsg) {
                console.log(errMsg);
            }
        });
    }

    $(document).ready(function () {
        $('.next-month').attr('disabled', 'disabled');
        $('.next-month').addClass('hidden');

        if (cm.useCivet == true) {
            getTimeNow();
        } 
    });
</script>
