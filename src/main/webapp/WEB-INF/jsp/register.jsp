<jsp:include page="templates/_header-no-search.jsp"/>

<br/>
<br/>
<br/>
<div class="container">

    <div class="row">

        <div class="col-md-2">
            <strong>
                <a href="/?page=exams" class="btn btn-success"><i class="fa fa-angle-double-left"
                                                                  aria-hidden="true"></i> Cancelar                </a>
            </strong>
        </div>

        <div class="col-md-8">

            <div id="login-overlay" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Registrar</h4>
                    </div>
                    <div class="modal-body">


                        <div class="row">

                            <div class="col-md-12">

                                <form id="registerForm" method="POST">

                                    <div class="form-group row">
                                        <label for="first_name"
                                               class="col-xs-5 col-form-label">Nome: *</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="first_name" id="first_name"
                                                   value="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="last_name"
                                               class="col-xs-5 col-form-label">Apelido: *</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="last_name" id="last_name"
                                                   value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="address_1"
                                               class="col-xs-5 col-form-label">Endereço 1: *</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="address_1" id="address_1"
                                                   value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="address_2"
                                               class="col-xs-5 col-form-label">Endereço 2:</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="address_2" id="address_2"
                                                   value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="town"
                                               class="col-xs-5 col-form-label">Cidade: *</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="town" id="town" value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="county"
                                               class="col-xs-5 col-form-label">Município: *</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="county" id="county" value="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="country"
                                               class="col-xs-5 col-form-label">País: *</label>
                                        <div class="col-xs-7">
                                            <select name="country" id="country" class="form-control"><option value="1">Afghanistan</option><option value="3">Albania</option><option value="4">Algeria</option><option value="5">American Samoa</option><option value="6">Andorra</option><option value="7">Angola</option><option value="8">Anguilla</option><option value="9">Antarctica</option><option value="10">Antigua And Barbuda</option><option value="11">Argentina</option><option value="12">Armenia</option><option value="13">Aruba</option><option value="14">Australia</option><option value="15">Austria</option><option value="16">Azerbaijan</option><option value="2">ÃƒÆ’land Islands</option><option value="17">Bahamas</option><option value="18">Bahrain</option><option value="19">Bangladesh</option><option value="20">Barbados</option><option value="21">Belarus</option><option value="22">Belgium</option><option value="23">Belize</option><option value="24">Benin</option><option value="25">Bermuda</option><option value="26">Bhutan</option><option value="27">Bolivia</option><option value="28">Bosnia And Herzegovina</option><option value="29">Botswana</option><option value="30">Bouvet Island</option><option value="31">Brazil</option><option value="32">British Indian Ocean Territory</option><option value="33">Brunei Darussalam</option><option value="34">Bulgaria</option><option value="35">Burkina Faso</option><option value="36">Burundi</option><option value="37">Cambodia</option><option value="38">Cameroon</option><option value="39">Canada</option><option value="40">Cape Verde</option><option value="41">Cayman Islands</option><option value="42">Central African Republic</option><option value="43">Chad</option><option value="44">Chile</option><option value="45">China</option><option value="46">Christmas Island</option><option value="47">Cocos (keeling) Islands</option><option value="48">Colombia</option><option value="49">Comoros</option><option value="50">Congo</option><option value="51">Congo, The Democratic Republic Of</option><option value="52">Cook Islands</option><option value="53">Costa Rica</option><option value="54">Cote D'ivoire</option><option value="55">Croatia</option><option value="56">Cuba</option><option value="57">Cyprus</option><option value="58">Czech Republic</option><option value="59">Denmark</option><option value="60">Djibouti</option><option value="61">Dominica</option><option value="62">Dominican Republic</option><option value="63">Ecuador</option><option value="64">Egypt</option><option value="65">El Salvador</option><option value="66">Equatorial Guinea</option><option value="67">Eritrea</option><option value="68">Estonia</option><option value="69">Ethiopia</option><option value="70">Falkland Islands (malvinas)</option><option value="71">Faroe Islands</option><option value="72">Fiji</option><option value="73">Finland</option><option value="74">France</option><option value="75">French Guiana</option><option value="76">French Polynesia</option><option value="77">French Southern Territories</option><option value="78">Gabon</option><option value="79">Gambia</option><option value="80">Georgia</option><option value="81">Germany</option><option value="82">Ghana</option><option value="83">Gibraltar</option><option value="84">Greece</option><option value="85">Greenland</option><option value="86">Grenada</option><option value="87">Guadeloupe</option><option value="88">Guam</option><option value="89">Guatemala</option><option value="90">Guernsey</option><option value="91">Guinea</option><option value="92">Guinea-bissau</option><option value="93">Guyana</option><option value="94">Haiti</option><option value="95">Heard Island And Mcdonald Islands</option><option value="96">Holy See (vatican City State)</option><option value="97">Honduras</option><option value="98">Hong Kong</option><option value="99">Hungary</option><option value="100">Iceland</option><option value="101">India</option><option value="102">Indonesia</option><option value="103">Iran, Islamic Republic Of</option><option value="104">Iraq</option><option value="105">Ireland</option><option value="106">Isle Of Man</option><option value="107">Israel</option><option value="108">Italy</option><option value="109">Jamaica</option><option value="110">Japan</option><option value="111">Jersey</option><option value="112">Jordan</option><option value="113">Kazakhstan</option><option value="114">Kenya</option><option value="115">Kiribati</option><option value="116">Korea, Democratic People's Republic Of</option><option value="117">Korea, Republic Of</option><option value="118">Kuwait</option><option value="119">Kyrgyzstan</option><option value="120">Lao People's Democratic Republic</option><option value="121">Latvia</option><option value="122">Lebanon</option><option value="123">Lesotho</option><option value="124">Liberia</option><option value="125">Libyan Arab Jamahiriya</option><option value="126">Liechtenstein</option><option value="127">Lithuania</option><option value="128">Luxembourg</option><option value="129">Macao</option><option value="130">Macedonia, The Former Yugoslav Republic Of</option><option value="131">Madagascar</option><option value="132">Malawi</option><option value="133">Malaysia</option><option value="134">Maldives</option><option value="135">Mali</option><option value="136">Malta</option><option value="137">Marshall Islands</option><option value="138">Martinique</option><option value="139">Mauritania</option><option value="140">Mauritius</option><option value="141">Mayotte</option><option value="142">Mexico</option><option value="143">Micronesia, Federated States Of</option><option value="144">Moldova, Republic Of</option><option value="145">Monaco</option><option value="146">Mongolia</option><option value="147">Montserrat</option><option value="148">Morocco</option><option value="149" selected="selected">Mozambique</option><option value="150">Myanmar</option><option value="151">Namibia</option><option value="152">Nauru</option><option value="153">Nepal</option><option value="154">Netherlands</option><option value="155">Netherlands Antilles</option><option value="156">New Caledonia</option><option value="157">New Zealand</option><option value="158">Nicaragua</option><option value="159">Niger</option><option value="160">Nigeria</option><option value="161">Niue</option><option value="162">Norfolk Island</option><option value="163">Northern Mariana Islands</option><option value="164">Norway</option><option value="165">Oman</option><option value="166">Pakistan</option><option value="167">Palau</option><option value="168">Palestinian Territory, Occupied</option><option value="169">Panama</option><option value="170">Papua New Guinea</option><option value="171">Paraguay</option><option value="172">Peru</option><option value="173">Philippines</option><option value="174">Pitcairn</option><option value="175">Poland</option><option value="176">Portugal</option><option value="177">Puerto Rico</option><option value="178">Qatar</option><option value="179">Reunion</option><option value="180">Romania</option><option value="181">Russian Federation</option><option value="182">Rwanda</option><option value="183">Saint Helena</option><option value="184">Saint Kitts And Nevis</option><option value="185">Saint Lucia</option><option value="186">Saint Pierre And Miquelon</option><option value="187">Saint Vincent And The Grenadines</option><option value="188">Samoa</option><option value="189">San Marino</option><option value="190">Sao Tome And Principe</option><option value="191">Saudi Arabia</option><option value="192">Senegal</option><option value="193">Serbia And Montenegro</option><option value="194">Seychelles</option><option value="195">Sierra Leone</option><option value="196">Singapore</option><option value="197">Slovakia</option><option value="198">Slovenia</option><option value="199">Solomon Islands</option><option value="200">Somalia</option><option value="201">South Africa</option><option value="202">South Georgia And The South Sandwich Islands</option><option value="203">Spain</option><option value="204">Sri Lanka</option><option value="205">Sudan</option><option value="206">Suriname</option><option value="207">Svalbard And Jan Mayen</option><option value="208">Swaziland</option><option value="209">Sweden</option><option value="210">Switzerland</option><option value="211">Syrian Arab Republic</option><option value="212">Taiwan, Province Of China</option><option value="213">Tajikistan</option><option value="214">Tanzania, United Republic Of</option><option value="215">Thailand</option><option value="216">Timor-leste</option><option value="217">Togo</option><option value="218">Tokelau</option><option value="219">Tonga</option><option value="220">Trinidad And Tobago</option><option value="221">Tunisia</option><option value="222">Turkey</option><option value="223">Turkmenistan</option><option value="224">Turks And Caicos Islands</option><option value="225">Tuvalu</option><option value="226">Uganda</option><option value="227">Ukraine</option><option value="228">United Arab Emirates</option><option value="229">United Kingdom</option><option value="230">United States</option><option value="231">United States Minor Outlying Islands</option><option value="232">Uruguay</option><option value="233">Uzbekistan</option><option value="234">Vanuatu</option><option value="235">Venezuela</option><option value="236">Viet Nam</option><option value="237">Virgin Islands, British</option><option value="238">Virgin Islands, U.S.</option><option value="239">Wallis And Futuna</option><option value="240">Western Sahara</option><option value="241">Yemen</option><option value="242">Zambia</option><option value="243">Zimbabwe</option></select>                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="email"
                                               class="col-xs-5 col-form-label">Endereço electronico: *</label>
                                        <div class="col-xs-7">
                                            <input type="text" class="form-control" name="email" id="email" value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="password"
                                               class="col-xs-5 col-form-label">Palavra-chave: *</label>
                                        <div class="col-xs-7">
                                            <input type="password" class="form-control" name="password" id="password"
                                                   value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="confirm_password"
                                               class="col-xs-5 col-form-label">Confirme palavra-chave: *</label>
                                        <div class="col-xs-7">
                                            <input type="password" class="form-control" name="confirm_password"
                                                   id="confirm_password" value="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="submit" class="col-xs-5 col-form-label"></label>
                                        <div class="col-xs-7">
                                            <button type="submit" name="submit" id="submit"
                                                    class="btn btn-success btn-block">Registrar</button>
                                        </div>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>
</div>



<jsp:include page="templates/_footer.jsp"/>