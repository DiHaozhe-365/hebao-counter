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