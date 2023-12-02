// 获取项目根路径 http://localhost/hebao_counter/
function getRootPath() {
    // 获取当前网址，如：http://localhost/hebao_counter/index.jsp
    const curWwwPath = window.document.location.href;
    // 获取主机地址之后的目录，如： hebao_counter/index.jsp
    const pathName = window.document.location.pathname;
    const pos = curWwwPath.indexOf(pathName);
    // 获取主机地址，如： http://localhost
    const localhostPaht = curWwwPath.substring(0, pos);
    // 获取带"/"的项目名，如：/hebao_counter
    const projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht + projectName);
}

function formatMoney(number) {
    var isNegative = number < 0; // 判断是否为负数

    // 取绝对值并将数字转换为字符串
    var amountString = Math.abs(number).toString();

    // 检查是否存在小数部分
    var parts = amountString.split('.');
    var decimal = '';
    if (parts.length === 2) {
        decimal = parts[1];
        // 如果小数部分少于2位数，则补零
        if (decimal.length < 2) {
            decimal += '0';
        }
    } else {
        decimal = '00';
    }

    // 添加千位分隔符
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // 根据是否为负数，添加货币符号
    var currencySymbol = isNegative ? '-￥' : '￥';

    // 拼接金额字符串
    var formattedAmount = currencySymbol + parts[0] + '.' + decimal;
    return formattedAmount;
}