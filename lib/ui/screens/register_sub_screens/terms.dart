import 'package:country_code_picker/country_code_picker.dart';
import 'package:cygnus/ui/widgets/BorderedTextField2.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:multiselect/multiselect.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:csc_picker/csc_picker.dart';

import '../../../data/model/planets.dart';


class terms extends StatefulWidget {


final  Function(bool) onPhotoChanged;

  terms({required this.onPhotoChanged});

  @override
  _termsState createState() => _termsState();
}

class _termsState extends State<terms> {
  String phone="";
  List<String> lanlist = [];
  String ctcode="";
  List<String> cityNames =[];
  var _textEditingController5 = TextEditingController();
  String textcode="";
  List<String> dritems= ['Select*','No','Occasionally','Special Moments','Yes' ];
  String drval= 'Select*';
  List<String> sisitems= ['Select*','No','1','2 ','3','4','5','6' ];
  String sisval= 'Select*';

  bool? checkedValue=false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    return SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You are almost Done',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
        constraints: BoxConstraints(maxHeight: 400),
        child: SingleChildScrollView(
        child: TextFormField(enabled: false,
          initialValue: "Welcome to Tunelk.com. \n "+
              " \"Tune\" is a matrimony website"+
              "and a mobile app owned by Tune"+
              " Solutions (Private) Limited"+
              "(“us”, “we”, or “our”).  Tune"+
              " is operating on a secure platf"+
              " orm (“Service”) built in accor"+
              "dance with global standards, w"+
              " ith utmost priority for privac"+
              " y and data security for you to"+
              " place advertisements containi"+
              "ng your own personal informati"+
              " on and data (or that of consen"+
              " ting third parties) for purpos"+
              " es of seeking a suitable matri"+
              " monial partner either on your"+
              " own behalf or on behalf of suc"+
              " h consenting third party.\n"+
              " This Agreement sets out the le"+
              "  gally binding terms for your u"+
              "  se of the Site and membership."+
              "  This Agreement may be modifie"+
              "  d by Tunelk.com from time to t"+
              "   ime. The membership and rights"+
              "  of admissions are reserved.\n"+
              "  1.	Acceptance of Terms of Use"+
              "   Agreement."+
              "  In order to use the Tunelk.com"+
              "  Service you must register as"+
              "  a member on the Website/ commu"+
              "  nity sites/ mobile application"+
              "  s (\"Site\")."+
              "   By using the Site, you agree t"+
              "   o be bound by these Terms of U"+
              "   se (\"Agreement\"). If you wish"+
              "   to become a Member and promote"+
              "   / advertise your profile to ot"+
              "   her Members and make use of th"+
              "  e Tunelk.com service (\"Service\""+
              "), read these Terms of Use an"+
              "  d follow the instructions in t"+
              "  he registration process. By us"+
              "  ing the Service, you consent t"+
              "  o submit your personal identif"+
              "  iable information, to collect,"+
              "  process, display and use the"+
              "  said information to provide th"+
              "  e Service."+
              "   To withdraw this consent, you"+
              "  must discontinue using our Ser"+
              "  vice and delete your account."+
              "  \n 2.	Eligibility."+
              "   To access and use Tunelk.com,"+
              "  You and any third party on who"+
              "  se behalf You may be accessing"+
              "  and using the Site:"+
              "   a.	Must not be less than 18 ye"+
              "  ars of age;\n"+
              "   b.	Must not be a minor under t"+
              "   he laws and regulations applic"+
              "   able to You (and to any Third"+
              "   Party); and\n"+
              "  c.	Must be legally competent t"+
              "   o marry under the laws and reg"+
              "  ulations applicable to You (an"+
              "  d to any Third Party)."+
              "  o	The Tunelk.com site is only"+
              "   to facilitate personal adverti"+
              "   sement for lawful marriage all"+
              "   iance between persons who are"+
              "   legally competent to enter int"+
              "  o matrimony under the laws to"+
              "  which they are subject. Member"+
              "   ship in the Service is void wh"+
              "   ere prohibited."+
              "   o	By using this Site, you repr"+
              "   esent and warrant that you hav"+
              "   e the right, consent, authorit"+
              "   y, and legal capacity to enter"+
              "   into this Agreement; submit r"+
              "   elevant information to us; and"+
              "  that you are not prohibited o"+
              "   r prevented by any applicable"+
              "  law for the time being in forc"+
              "   e or any order or decree or in"+
              "  junction from any court, tribu"+
              "   nal or any such competent auth"+
              "  ority restraining you from ent"+
              "   ering into matrimony."+
              "  o	You further confirm that you"+
              "  , intent to seek a life partne"+
              "   r and that you shall not use t"+
              "   his site for casual dating. Yo"+
              "   u also agree to abide by all o"+
              "  f the terms and conditions of"+
              "   this Agreement. If at any time"+
              "   Tunelk.com is of the opinion"+
              "  (in its sole discretion) or ha"+
              "  s any reason to believe that y"+
              "   ou are not eligible to become"+
              "  a member or that you have made"+
              "   any misrepresentation, Tunelk"+
              "      .com reserves the right to for"+
              "  thwith terminate your membersh"+
              "   ip and / or your right to use"+
              "  the Service without any refund"+
              "   to you of any of your unutili"+
              "   zed subscription fee."+
              "   3.	Account Security."+
              "   You are responsible for mainta"+
              "   ining the confidentiality of y"+
              "   our login credentials you desi"+
              "   gnate during the registration"+
              "    process, and you are solely re"+
              "   sponsible for all activities t"+
              "   hat occur under your account."+
              "   You agree to immediately notif"+
              "  y us of any disclosure or unau"+
              "   thorized use of your account o"+
              "  r any other breach of security"+
              "  , and ensure that you log out"+
              "   from your account at the end o"+
              "  f each session."+
              "  4.	Term and Termination."+
              "  a.	This Agreement will be effe"+
              "   ctive, valid and subsisting as"+
              "  long as you use our Site."+
              "   b.	You may terminate your memb"+
              "  ership at any time, for any re"+
              "  ason by writing to Tunelk.com."+
              "   In the event you terminate yo"+
              "  ur membership, you will not be"+
              "   entitled to a refund of any u"+
              "  nutilized subscription fees, i"+
              "  f any, paid by you, except whe"+
              "  re otherwise guaranteed in wri"+
              "   ting."+
              "   c.	Tunelk.com may terminate yo"+
              "  ur access to the Site and/or y"+
              "  our membership for any reason"+
              "  including but not limited to b"+
              "  reach of the terms of use, usi"+
              "   ng the service for commercial"+
              "  purpose, engaging in prohibite"+
              "    d or inappropriate communicati"+
              "   on or activity, by sending not"+
              "   ice to you at the email addres"+
              "  s as provided by you in your a"+
              "   pplication for membership or s"+
              "  uch other email address as you"+
              "  may later provide to Tunelk.c"+
              "   om. If Tunelk.com terminates y"+
              "   our membership for breach of t"+
              "  erms of this Agreement, you wi"+
              "   ll not be entitled to any refu"+
              "  nd of any Subscription fees, i"+
              "   f any, paid by you."+
              "   o	Certain provisions of this A"+
              "  greement including sections 4,"+
              "  5, 6, 7 and sections 9 to 16,"+
              "   of this Agreement shall remai"+
              "   n effective even on terminatio"+
              "  n."+
              "  o	Term for the paid Membership"+
              "   would be in accordance with t"+
              "   he type of membership undertak"+
              "  en."+
              "  5.	Non-Commercial Use by Membe"+
              "   rs."+
              "   The Site is for the personal u"+
              "   se of individual members to ad"+
              "   vertise and promote their prof"+
              "   iles for the purpose of genera"+
              "  ting accepts from relevant mat"+
              "  ches and cannot be used in con"+
              "  nection with any commercial en"+
              "  deavors. This includes providi"+
              "  ng links to other web sites, w"+
              "  hether deemed competitive to T"+
              "  unelk.com or otherwise. Organi"+
              "   zations, companies, and/or bus"+
              "   inesses cannot become Members"+
              "   of Tunelk.com and should not u"+
              "   se the Tunelk.com Service or S"+
              "   ite for any purpose. Illegal a"+
              "    nd/or unauthorized uses of the"+
              "   Site, including unauthorized"+
              "   framing of or linking to the S"+
              "   ite will be investigated, and"+
              "   appropriate legal action will"+
              "   be taken, including without li"+
              "   mitation, civil, criminal, and"+
              "   injunctive redress."+
              "   6.	Other Terms of Use for Memb"+
              "   ers."+
              "   o	Tunelk.com reserves the righ"+
              "   t in it\'s sole discretion to r"+
              "  eview the activity and status"+
              "  of each account and block acce"+
              "   ss to the member based on such"+
              "   review."+
              "   o	Tunelk.com reserve the right"+
              "   at its sole discretion to res"+
              "  trict/suspend your free access"+
              "    to its website based on revie"+
              "   w of the member's activity, st"+
              "   atus or any such criteria Tune"+
              "    lk.com may deems fit and prope"+
              "   r with due intimation to you."+
              "   o	You hereby confirm that as o"+
              "   n date of this registration, y"+
              "   ou do not have any objection t"+
              "    o receive emails, SMS/WhatsApp"+
              "    messages and calls from Tunel"+
              "   k.com and members of Tunelk.co"+
              "   m as long as you are a registe"+
              "    red member of Tunelk.com inclu"+
              "   ding SMS permission for authen"+
              "   ticating mobile verification w"+
              "   and transactions via OTP, sent"+
              "  by the Payment Gateway. This"+
              "   consent extends to emails, mes"+
              "  sages or calls relating but no"+
              "    t limited to phone number veri"+
              "   fication, the provision of mat"+
              "   chmaking advertising service,"+
              "   matchmaking enquiries and prom"+
              "   otions."+
              "   o	Multiple profiles of the sam"+
              "   e person are not allowed on ou"+
              "    r Site. Tunelk.com reserves th"+
              "   e right to deactivate all mult"+
              "  iple profiles without any refu"+
              "  nd of subscription fees."+
              "   o	You confirm that the Content"+
              "   , information including the pe"+
              "   rsonal information provided by"+
              "   you is correct and accurate."+
              "   o	You are strongly advised to"+
              "   submit copy of your Driving Li"+
              "   cense, Passport or any other G"+
              "   overnment issued identity and"+
              "  add a trust badge to your prof"+
              "  ile."+
              "  o	Tunelk.com reserves the righ"+
              "   t to take appropriate steps to"+
              "   protect Tunelk.com and/or its"+
              "  Members from any abuse/misuse"+
              "  as it deems appropriate in it"+
              "  s sole discretion."+
              "   o	Tunelk.com reserves the righ"+
              "   t to screen communications/adv"+
              "  ertisements that you may send"+
              "  to other Member(s) and also re"+
              "  gulate the same by deleting un"+
              "  warranted/obscene communicatio"+
              "   ns/advertisements at any time"+
              "   at its sole discretion without"+
              "  prior notice to any Member."+
              "    o	Tunelk.com Members who subsc"+
              "  ribe to the Tunelk.com Select"+
              "   Service hereby, unconditionall"+
              "   y and irrevocably confirm that"+
              "   you have read terms and condi"+
              "   tions and agree to abide by th"+
              "    em."+
              "   7.	Proprietary Rights in the C"+
              "    ontent on Tunelk.com"+
              "    Tunelk.com owns and retains al"+
              "    l proprietary rights in the Tu"+
              "   nelk.com Site and the Tunelk.c"+
              "  om Service. The Site contains"+
              "  the copyrighted material, trad"+
              "   emarks, and other proprietary"+
              "   information of Tunelk.com, and"+
              "   its licensors. Except for tha"+
              "   t information which is in the"+
              "  public domain such as member p"+
              "   rofile or for which permission"+
              "   has been obtained from the us"+
              "   er, you cannot copy, modify, p"+
              "   ublish, transmit, distribute,"+
              "   perform, display, or sell any"+
              "   such proprietary information."+
              "   Any such act or an attempted a"+
              "   ct on your part shall constitu"+
              "   te a violation of this Agreeme"+
              "   nt and your membership is liab"+
              "   le to be terminated forthwith"+
              "   by Tunelk.com without refund o"+
              "   f any of your unused Subscript"+
              "   ion fees. Tunelk.com reserves"+
              "   right to take legal action (ci"+
              "   vil and/or criminal) wherever"+
              "   applicable for any violations."+
              "    8.	Content Posted on the Site."+
              "    o	You understand and agree tha"+
              "   t Tunelk.com may delete any li"+
              "   sting, content, communication,"+
              "   photos or profiles (collectiv"+
              "   ely, \"Content\") that in the so"+
              "  le judgment of Tunelk.com viol"+
              "  ate this Agreement or which mi"+
              "   ght be offensive, illegal, or"+
              "  that might violate the rights,"+
              "   harm, or threaten the safety"+
              "   of either Tunelk.com and/or it"+
              "   s Members."+
              "   o	With respect to Content you"+
              "  submit or make available for i"+
              "  nclusion on publicly accessibl"+
              "   e areas of the Site including"+
              "  but not limited to your contac"+
              "   t details, you hereby uncondit"+
              "   ionally and irrevocably grant"+
              "   to Tunelk.com the consent and"+
              "   license to use, store, distrib"+
              "   ute, reproduce, prepare deriva"+
              "   tive works of, modify, adapt,"+
              "   publicly perform and publicly"+
              "  display such Content on the Si"+
              "   te and to the members of Tunel"+
              "   k.com community site(s) from t"+
              "  ime to time."+
              "    o	By submitting your success s"+
              "    tory you hereby expressly auth"+
              "   orize Tunelk.com to use, publi"+
              "   sh, display your photographs a"+
              "    nd testimony on the Site."+
              "  o	You understand and hereby ag"+
              "  ree that all information, data"+
              "   , text, photographs, graphics,"+
              "   communications, tags, or othe"+
              "    r Content whether publicly pos"+
              "   ted or privately transmitted o"+
              "   r otherwise made available to"+
              "    Tunelk.com are the sole respon"+
              "   sibility of the person from wh"+
              "   om such Content originated and"+
              "  shall be at the member\'s/pers"+
              "  on\'s sole risks and consequenc"+
              "   es. This means that you (and n"+
              "   ot Tunelk.com) are solely resp"+
              "   onsible for all Content that y"+
              "   ou upload, post, email, transm"+
              "   it or otherwise make available"+
              "   via the Service. Tunelk.com d"+
              "   oes not control the Content po"+
              "   sted via the Service and, as s"+
              "   uch, does not guarantee the ac"+
              "   curacy, integrity or quality o"+
              "   f such Content. We advise all"+
              "   User/s to independently verify"+
              "   the content /information post"+
              "   ed by the other members before"+
              "   acting upon the same and unde"+
              "   r no circumstances will Tunelk"+
              "      .com be liable in any way for"+
              "  any Content, including, but no"+
              "  t limited to, any errors or om"+
              "   issions in any Content, or any"+
              "   loss or damage of any kind in"+
              "    curred as a result of the use"+
              "    of any Content posted, emailed"+
              "    , transmitted or otherwise mad"+
              "     e available via the Service."+
              "   o	Tunelk.com reserves the righ"+
              "   t to verify the authenticity o"+
              "  f Content posted on the Site."+
              "  In exercising this right, Tune"+
              "   lk.com may ask you to provide"+
              "  any documentary or other form"+
              "  of evidence supporting the Con"+
              "   tent you post on the Site. If"+
              "   you fail to produce such evide"+
              "    nce to the satisfaction of Tun"+
              "   elk.com, Tunelk.com may, in it"+
              "    s sole discretion, terminate y"+
              "   our Membership without a refun"+
              "  d. "+
              "  Your Interaction with other M"+
              "  embers & Member Disputes."+
              "   You are solely responsible for"+
              "   your advertisement/communicat"+
              "    ions with other Tunelk.com Mem"+
              "   bers. Tunelk.com reserves the"+
              "   right, but has no obligation,"+
              "   to monitor disputes between yo"+
              "  u and other Members. Tunelk.co"+
              "  m also reserves the right to t"+
              "   ake appropriate action against"+
              "   errant members. However, Tune"+
              "   lk.com is not obliged to share"+
              "   such action with other member"+
              "   s, including complainants. Tun"+
              "   elk.com expressly disclaims an"+
              "   y responsibility or liability"+
              "   for any transactions or intera"+
              "   ctions between the members int"+
              "   er-se"+
              "   Privacy."+
              "  Use of the Tunelk.com Site and"+
              "   /or the Tunelk.com Service is"+
              "   governed by our Privacy Policy"+
              "  and follow guidelines to prot"+
              "   ect your privacy."+
              "  Disclaimers."+
              "   a.	Tunelk.com is not responsib"+
              "    le for any incorrect or inaccu"+
              "   rate Content/listing posted on"+
              "   the Site or in connection wit"+
              "    h the Tunelk.com Service, whet"+
              "   her caused by Users, Members o"+
              "   r by any of the equipment or p"+
              "   rogramming associated with or"+
              "   utilized in the Service, nor f"+
              "   or the conduct of any User and"+
              "   /or Member of the Tunelk.com S"+
              "   ervice whether online or offli"+
              "   ne."+
              "   b.	Tunelk.com assumes no respo"+
              "  nsibility for any error, omiss"+
              "  ion, interruption, deletion, d"+
              "  efect, delay in operation or t"+
              "   ransmission, communications li"+
              "  ne failure, theft or destructi"+
              "   on or unauthorized access to,"+
              "  or alteration of, User and/or"+
              "  Member communications or any c"+
              "   ommunications by Tunelk.com to"+
              "   its Members."+
              "   c.	Tunelk.com is not responsib"+
              "   le for any problems or technic"+
              "  al malfunction of any telephon"+
              "   e network or lines, computer o"+
              "  n-line-systems, servers or pro"+
              "   viders, computer equipment, so"+
              "   ftware, failure of email or pl"+
              "    ayers on account of technical"+
              "   problems or traffic congestion"+
              "   on the Internet or at any web"+
              "   site or combination thereof,"+
              "   including injury or damage to"+
              "   Users and/or Members or to any"+
              "   other person\'s computer relat"+
              "   ed to or resulting and/or in c"+
              "    onnection with the Tunelk.com"+
              "   Service."+
              "   d.	Under no circumstances will"+
              "    Tunelk.com be responsible for"+
              "   any loss or damage resulting"+
              "    from anyone's use of the Site"+
              "    or the Service and/or any Cont"+
              "    ent posted on the Tunelk.com S"+
              "   ite or transmitted to Tunelk.c"+
              "  om Members. You should not pro"+
              "    vide your financial informatio"+
              "    n (for example, your credit ca"+
              "   rd or bank account information"+
              "    ), or wire or otherwise send m"+
              "   oney, to other Members."+
              "   e.	The exchange of matchmaking"+
              "   profile(s) through or by \"Tun"+
              "   elk.com\" is not a matrimonial"+
              "   offer and/or recommendation fr"+
              "   om/by Tunelk.com. Tunelk.com s"+
              "    hall not be responsible for an"+
              "   y loss or damage to any indivi"+
              "   dual arising out of, or subseq"+
              "   uent to, any relations (includ"+
              "   ing but not limited to matrimo"+
              "   nial relations) established pu"+
              "   rsuant to the use of Tunelk.co"+
              "   m service."+
              "   f.	The Site and the Service ar"+
              "   e provided \"AS-IS\" and Tunelk."+
              "  com expressly disclaims any wa"+
              "   rranty of fitness for a partic"+
              "  ular purpose or non-infringeme"+
              "  nt. Tunelk.com cannot guarante"+
              "  e and does not promise any spe"+
              "  cific results from use of the"+
              "   Site and/or the Tunelk.com Ser"+
              "   vice. You understand that Tune"+
              "   lk.com makes no guarantees, ei"+
              "   ther express or implied, regar"+
              "  ding compatibility with indivi"+
              "  duals you meet through the Ser"+
              "   vice."+
              "   g.	Tunelk.com expressly discla"+
              "   ims any liability or responsib"+
              "   ility whatsoever and howsoever"+
              "   arising as a result of any Co"+
              "   ntent/listing posted on the Si"+
              "   te / made available to Tunelk."+
              "   com by any Members or the user"+
              "   s of the Site or any third par"+
              "   ty."+
              "   h.	Tunelk.com does not assume"+
              "   any responsibility or liabilit"+
              "   y for any illegal Content post"+
              "    ed on the Site by any Members,"+
              "    users or any third party."+
              "    i.	All liability, whether civi"+
              "   l or criminal arising out of a"+
              "    ny Content that is Posted on t"+
              "    he Site will be of that Member"+
              "   / user / third party who has"+
              "    Posted such Content and Tunelk"+
              "        .com reserves its right to cla"+
              "     im damages from such Member/ u"+
              "    ser / third party that it may"+
              "    suffer as a result of such Con"+
              "    tent Posted on the Site. Tunel"+
              "   k.com does not claim ownership"+
              "   of Content you submit or make"+
              "   available for inclusion on th"+
              "   e Service."+
              "   Limitation on Liability."+
              "   In no event will Tunelk.com be"+
              "    liable to you or any third pe"+
              "    rson for any indirect, consequ"+
              "    ential, exemplary, incidental,"+
              "    special or punitive damages,"+
              "    including also lost profits ar"+
              "    ising from your use of the Sit"+
              "   e or the Tunelk.com Service, e"+
              "   ven if Tunelk.com has been adv"+
              "    ised of the possibility of suc"+
              "    h damages. Notwithstanding any"+
              "    thing to the contrary containe"+
              "   d herein, Tunelk.com's liabili"+
              "   ty to you for any cause whatso"+
              "   ever, and regardless of the fo"+
              "  rm of the action, will at all"+
              "   times be limited to the amount"+
              "   paid, if any, by you to Tunel"+
              "    k.com, for the Service during"+
              "   the term of membership."+
              "   Jurisdiction."+
              "  If there is any dispute about"+
              "   or involving the Site and/or t"+
              "   he Service, by using the Site,"+
              "  you unconditionally agree tha"+
              "   t all such disputes and/or dif"+
              "   ferences will be governed by t"+
              "  he laws of Sri Lanka  and shal"+
              "    l be subject to the exclusive"+
              "    jurisdiction of the Competent"+
              "   Courts in Sri Lanka only."+
              "   Indemnity."+
              "  You agree to indemnify and hol"+
              "   d Tunelk.com, its subsidiaries"+
              "   , affiliates, officers, agents"+
              "   , and other partners and emplo"+
              "   yees, fully indemnified and ha"+
              "   rmless from any loss, liabilit"+
              "   y, claim, or demand, including"+
              "   reasonable attorney's fees, m"+
              "   ade by any third party due to"+
              "    or arising out of your use of"+
              "   the Service in violation of th"+
              "   is Agreement and/or arising fr"+
              "   om a breach of these Terms of"+
              "   Use and/or any breach of your"+
              "   representations and warranties"+
              "   set forth above and/or any fr"+
              "   audulent act on your part."+
              "   Other."+
              "   1.	This Agreement, accepted up"+
              "  on use of the Site and further"+
              "   affirmed by becoming a Member"+
              "   of the Tunelk.com service, co"+
              "  ntains the entire agreement be"+
              "   tween you and Tunelk.com regar"+
              "   ding the use of the Site and/o"+
              "  r the Service. If any provisio"+
              "  n of this Agreement is held in"+
              "  valid, the remainder of this A"+
              "   greement shall continue in ful"+
              "  l force and effect.",
          minLines: 400,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style:  TextStyle(
              color: Colors.white
          ),
          onChanged: (value) => {

          },
          decoration: InputDecoration(

            hintText: '',
            hintStyle: TextStyle(
                color: Colors.white
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
        ),
        ),
        ),


        SizedBox(height: 40),
        Center(
          child: CheckboxListTile(
           title: Text("Agree to terms and conditions."),
           value: checkedValue,
           onChanged: (newValue) {
            setState(() {
             checkedValue = newValue;
             widget.onPhotoChanged(newValue!);
            });
           },
           controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          )
        ),


        // Expanded(
        //   child: Center(
        //     child: Container(
        //       child: DecimalNumberPicker(
        //           decimalPlaces: 1,
        //           decimalDecoration: BoxDecoration(
        //             border: Border.all(color: Colors.white, width: 2),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           value: age,
        //           minValue: 100,
        //           maxValue: 300,
        //           onChanged: (value) => {
        //                 setState(() {
        //                   age = value;
        //                 }),
        //                 widget.onChanged(value)
        //               }),
        //     ),
        //   ),
        // ),
      ],
    ),);
  }





}
