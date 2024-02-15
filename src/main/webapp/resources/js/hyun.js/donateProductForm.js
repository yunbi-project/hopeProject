$(document).ready(function() {
    // 기업물품후원, 개인물품 후원
    $('input[name="donateGood"]').change(function() {
        var isPersonal = $(this).val() === '개인물품후원';
        var isCompany = $(this).val() === '기업물품후원';

        if (isPersonal) {
            $('#h_companyName, #h_manager, #h_businessNumberInput, #h_businessNameInput, #h_managerInput').hide();
            $('#h_name, #h_residentNumerInput, #h_nameInput').show();
        } else if (isCompany) {
            $('#h_name, #h_residentNumerInput, #h_nameInput').hide();
            $('#h_companyName, #h_manager, #h_businessNumberInput, #h_businessNameInput, #h_managerInput').show();
        }
    });

    // 기부금영수증 발급 여부 변경 시 이벤트 처리
    $('input[name="donateGoodsreceipt"]').change(function() {
        var isReceiptY = $(this).val() === 'Y';
        var isReceiptN = $(this).val() === 'N';
        var isPersonal = $('input[name="donateGood"]:checked').val() === '개인물품후원';
        var isCompany = $('input[name="donateGood"]:checked').val() === '기업물품후원';

        if (isReceiptY && isPersonal) {
            $('#h_residentNumer, #h_residentNumerInput').show();
            $('#h_businessNumberInput, #h_businessNumber').hide();
        } else if (isReceiptY && isCompany) {
            $('#h_residentNumer, #h_residentNumerInput, #h_businessNumberInput, #h_businessNumber').show();
        } else if (isReceiptN && isPersonal) {
            $('#h_residentNumer, #h_residentNumerInput, #h_businessNumberInput, #h_businessNumber').hide();
        } else if (isReceiptN && isCompany) {
            $('#h_residentNumer, #h_residentNumerInput, #h_businessNumberInput, #h_businessNumber').hide();
        }
    });
});