<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer {
    background-color: #495057;
    color: #fff;
    padding: 8rem 0;
}
footer .footer-container {
    width: 1024px;
    margin: 0 auto;
}
.footer-top {
    display: flex;
    justify-content: space-between;
    margin-bottom: 4rem;
}
.footer-logo {
    width: 130px;
    height: 37px;
    background-image: url(http://localhost:9000/daangn/images/logo_white.svg);
    background-size: 130px 37px;
}
.footer-list-item {
    display: block;
    font-size: 1.6rem;
    margin-bottom: 1.6rem;
}
.footer-bottom {
    display: flex;
    justify-content: space-between;
    border-top: 1px solid rgba(255,255,255,0.1);
    margin-top: 3.2rem;
}
#copyright {
    color: #ADB5BD;
    margin-top: 3.2rem;
}
.copyright-list {
    list-style-type: none;
    margin-bottom: 0.4rem;
}
.copyright-list-item {
    display: inline-block;
    font-size: 14px;
    margin: 0 0.8rem 0 0;
    text-decoration: none;
}
#social {
    margin-top: 3.2rem;
    margin-bottom: 3.2rem;
}
.social-list-item {
    display: inline-block;
    margin: 0px;
    margin-right: 2.4rem;
}
.global-links {
    padding-left: 26px;
    display: inline-block;
    margin: 0px;
}
.footer-list-item {
    display: block;
    font-size: 1.6rem;
    margin-bottom: 1.6rem;
}
footer{
	text-decoration: none;
}
.footer-list-item > a{
	color: white;
	text-decoration: none;
	font-size: 15px;
}
.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0 0 0 0);
    border: 0;
}
.global-links select {
    margin-left: 6px;
    text-decoration: underline;
    text-underline-position: under;
    vertical-align: top;
    background: #495057;
    color: #ADB5BD;
    font-size: 16px;
    line-height: 24px;
    border: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    -ms-appearance: none;
}
footer{
	 padding-top: 150px; /* 이부분 수정해도 되는지 물어보기 */ 
}
</style>
</head>
<body>
	<footer id="footer">
  <div class="footer-container">
    <div class="footer-top">
      <div class="footer-logo"></div>
      <ul class="footer-list">
        <li class="footer-list-item"><a class="link-highlight" href="">믿을 수 있는 중고거래</a></li>
        <li class="footer-list-item"><a class="link-highlight" href="">자주 묻는 질문</a></li>
      </ul>
      <ul class="footer-list">
        <li class="footer-list-item"><a target="_blank" href="">회사 소개</a></li>
        <li class="footer-list-item"><a target="_blank" class="link-highlight" href="">광고주센터</a></li>
        <li class="footer-list-item">
          <a target="_blank" class="ga-click" data-event-category="town_link_from" data-event-action="index_base" data-event-label="footer_town" href="">동네가게</a>
        </li>
      </ul>
      <ul class="footer-list policy">
        <li class="footer-list-item"><a target="_blank" href="">이용약관</a></li>
        <li class="footer-list-item"><a target="_blank" href="">개인정보처리방침</a></li>
        <li class="footer-list-item"><a target="_blank" href="">위치기반서비스 이용약관</a></li>
      </ul>
    </div>
    <div class="footer-bottom">
      <div id="copyright">
        <ul class="copyright-list">
          <li class="copyright-list-item">고객문의 <a href=""></a></li>
          <li class="copyright-list-item">제휴문의 <a href=""></a></li>
        </ul>
        <ul class="copyright-list">
          <li class="copyright-list-item">지역광고 <a href=""></a></li>
          <li class="copyright-list-item">PR문의 <a href=""></a></li>
        </ul>
        <ul class="copyright-list copyright-list-light">
          <li class="copyright-list-item"><address>서울특별시 구로구 디지털로 30길 28 609호 (당근서비스)</address></li>
          <li class="copyright-list-item">사업자 등록번호 : 375-87-00088</li>
          <li class="copyright-list-item">직업정보제공사업 신고번호 : J1200020200016</li>
        </ul>
        <div id="social">
          <ul class="social-list">
            <li class="social-list-item">
              <a target="_blank" class="footer-social-link" href="https://www.facebook.com/daangn">
                <img alt="facebook" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-facebook-0563f4a93852d073b41f13b8bcabb03d47af3bb3a6755cdfedd8a73686c7f18c.svg">
                <span class="sr-only">facebook</span>
</a>            </li>
            <li class="social-list-item">
              <a target="_blank" class="footer-social-link" href="https://www.instagram.com/daangnmarket/">
                <img alt="instagram" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-instagram-2f6c88a461597907c114b7ce28eab053fcae791ed26417915fefb6f7c9f95756.svg">
                <span class="sr-only">instagram</span>
</a>            </li>
            <li class="social-list-item">
              <a target="_blank" class="footer-social-link" href="https://blog.naver.com/daangn">
                <img alt="blog" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-blog-e1b0d512d1766a6962ec5bbb5b0803d2a6a9c55ad97db5ba9eebb76013caceba.svg">
                <span class="sr-only">blog</span>
</a>            </li>
            <li class="global-links">
              <img src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-global-2f53678b428ec623cefd07a90dd7777f3e55fc0433918f645d7d75ace6ff1fc3.png" width="24" height="24">
              <select id="global-links-select">
                <option value="kr">한국</option>
                <option value="https://uk.karrotmarket.com">영국</option>
                <option value="https://ca.karrotmarket.com">캐나다</option>
                <option value="https://us.karrotmarket.com">미국</option>
                <option value="https://jp.karrotmarket.com">일본</option>
            </select>
            </li>
          </ul>
        </div>
        <div class="copyright-text">©Danggeun Market Inc.</div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>