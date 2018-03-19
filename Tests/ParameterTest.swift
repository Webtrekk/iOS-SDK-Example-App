//The MIT License (MIT)
//
//Copyright (c) 2016 Webtrekk GmbH
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
//"Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject
//to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Created by arsen.vartbaronov on 17/08/16.
//

import XCTest
import Nimble
import Webtrekk

class ParameterTest: WTBaseTestNew {
    var mainViewController: ViewController!

    override func getConfigName() -> String? {
        return String("webtrekk_config_no_autoTrack")
    }

    func testVariablesParameterGlobal() {
        doURLSendTestAction() {
            let tracker = WebtrekkTracking.instance()

            let trackerData = [
//                "ADVERTISEMENT": "ADVERTISEMENT",
//                "ADVERTISEMENT_ACTION": "ADVERTISEMENT_ACTION",
                "BIRTHDAY": "19761008",
//                "CITY": "CITY",
//                "COUNTRY": "COUNTRY",
                "CURRENCY": "CURRENCY",
                "CUSTOMER_ID": "CUSTOMER_ID",
                "EMAIL": "EMAIL",
                "EMAIL_RID": "EMAIL_RID",
//                "GNAME": "GNAME",
                "GENDER": "1",
                "INTERN_SEARCH": "INTERN_SEARCH"
//                "IP_ADDRESS": "IP_ADDRESS",
//                "SNAME": "SNAME",
//                "NEWSLETTER": "NEWSLETTER",
//                "ORDER_NUMBER": "ORDER_NUMBER",
//                "PAGE_URL": "PAGE_URL",
//                "PHONE": "PHONE",
//                "PRODUCT": "PRODUCT",
//                "PRODUCT_COST": "PRODUCT_COST",
//                "PRODUCT_COUNT": "2",
//                "PRODUCT_STATUS": "conf",
//                "STREET": "STREET",
//                "STREETNUMBER": "STREETNUMBER",
//                "ORDER_TOTAL": "ORDER_TOTAL",
//                "VOUCHER_VALUE": "VOUCHER_VALUE",
//                "ZIP": "ZIP"
            ]

            for (trackerKey, trackerValue) in trackerData {
                tracker[trackerKey] = trackerValue
            }

            tracker.trackPageView("somePageName")
        }

        self.timeout = 10
        doURLSendTestCheck() { parametersArr in
//          expect(parametersArr["mc"]).to(equal("ADVERTISEMENT"))
//          expect(parametersArr["mca"]).to(equal("ADVERTISEMENT_ACTION"))
            expect(parametersArr["uc707"]).to(equal("19761008"))
//          expect(parametersArr["uc708"]).to(equal("CITY"))
//          expect(parametersArr["uc709"]).to(equal("COUNTRY"))
            expect(parametersArr["cr"]).to(equal("CURRENCY"))
            expect(parametersArr["cd"]).to(equal("CUSTOMER_ID"))
            expect(parametersArr["uc700"]).to(equal("EMAIL"))
            expect(parametersArr["uc701"]).to(equal("EMAIL_RID"))
//          expect(parametersArr["uc703"]).to(equal("GNAME"))
            expect(parametersArr["uc706"]).to(equal("1"))
            expect(parametersArr["is"]).to(equal("INTERN_SEARCH"))
//          expect(parametersArr["X_WT_IP"]).to(equal("IP_ADDRESS"))
//          expect(parametersArr["uc704"]).to(equal("SNAME"))
//          expect(parametersArr["uc702"]).to(equal("NEWSLETTER"))
//          expect(parametersArr["oi"]).to(equal("ORDER_NUMBER"))
//          expect(parametersArr["pu"]).to(equal("PAGE_URL"))
//          expect(parametersArr["uc705"]).to(equal("PHONE"))
//          expect(parametersArr["ba"]).to(equal("PRODUCT"))
//          expect(parametersArr["co"]).to(equal("PRODUCT_COST"))
//          expect(parametersArr["qn"]).to(equal("2"))
//          expect(parametersArr["st"]).to(equal("conf"))
//          expect(parametersArr["uc711"]).to(equal("STREET"))
//          expect(parametersArr["uc712"]).to(equal("STREETNUMBER"))
//          expect(parametersArr["ov"]).to(equal("ORDER_TOTAL"))
//          expect(parametersArr["cb563"]).to(equal("VOUCHER_VALUE"))
//          expect(parametersArr["uc710"]).to(equal("ZIP"))
        }
    }

    func testVariablesParameterScreen() {
        if self.mainViewController == nil {
            self.mainViewController = ViewController()
        }

        doURLSendTestAction() {
            self.mainViewController.beginAppearanceTransition(true, animated: false)
            let tracker = WebtrekkTracking.trackerForAutotrackedViewController(self.mainViewController)

            let trackerData = [
//                "ADVERTISEMENT": "ADVERTISEMENT",
//                "ADVERTISEMENT_ACTION": "ADVERTISEMENT_ACTION",
                "BIRTHDAY": "19761008",
//                "CITY": "CITY",
//                "COUNTRY": "COUNTRY",
                "CURRENCY": "CURRENCYOver",
                "CUSTOMER_ID": "CUSTOMER_ID",
                "EMAIL": "EMAIL",
                "EMAIL_RID": "EMAIL_RID",
//                "GNAME": "GNAME",
                "GENDER": "1",
                "INTERN_SEARCH": "INTERN_SEARCHOver",
//                "IP_ADDRESS": "IP_ADDRESS",
//                "SNAME": "SNAME",
//                "NEWSLETTER": "NEWSLETTER",
                "ORDER_NUMBER": "ORDER_NUMBER",
//                "PAGE_URL": "PAGE_URL",
//                "PHONE": "PHONE",
                "PRODUCT": "PRODUCT",
                "PRODUCT_COST": "PRODUCT_COST",
                "PRODUCT_COUNT": "2",
                "PRODUCT_STATUS": "conf",
//                "STREET": "STREET",
//                "STREETNUMBER": "STREETNUMBER",
                "ORDER_TOTAL": "ORDER_TOTAL",
                "VOUCHER_VALUE": "VOUCHER_VALUE"
//                "ZIP": "ZIP"
            ]

            for (trackerKey, trackerValue) in trackerData {
                tracker[trackerKey] = trackerValue
            }

            let pagePropertiesL = PageProperties(
                name: ""
            )

            let ecommercePropertiesL = EcommerceProperties(
                products: [
                    EcommerceProperties.Product(
                        name: "productName1",
                        categories: [
                            11: "productCat11",
                            12: "productCat12"
                        ],
                        price: "100",
                        quantity: 1
                    ),
                    EcommerceProperties.Product(
                        name: "productName2",
                        categories: [
                            11: "productCat21",
                            12: "productCat22"
                        ],
                        price: "200",
                        quantity: 2
                    )
                ],
                totalValue: "ORDER_TOTALCODE"
            )

            let pageEvent = PageViewEvent(
                pageProperties: pagePropertiesL, // required
                ecommerceProperties: ecommercePropertiesL
            )

            tracker.trackPageView(pageEvent)

            self.mainViewController.endAppearanceTransition()
        }

        self.timeout = 10

        doURLSendTestCheck() { parametersArr in
//          expect(parametersArr["mc"]).to(equal("ADVERTISEMENT"))
//          expect(parametersArr["mca"]).to(equal("ADVERTISEMENT_ACTION"))
            expect(parametersArr["uc707"]).to(equal("19761008"))
//          expect(parametersArr["uc708"]).to(equal("CITY"))
//          expect(parametersArr["uc709"]).to(equal("COUNTRY"))
            expect(parametersArr["cr"]).to(equal("CURRENCYOver"))
            expect(parametersArr["cd"]).to(equal("CUSTOMER_ID"))
            expect(parametersArr["uc700"]).to(equal("EMAIL"))
            expect(parametersArr["uc701"]).to(equal("EMAIL_RID"))
//          expect(parametersArr["uc703"]).to(equal("GNAME"))
            expect(parametersArr["uc706"]).to(equal("1"))
            expect(parametersArr["is"]).to(equal("INTERN_SEARCHOver"))
//          expect(parametersArr["X_WT_IP"]).to(equal("IP_ADDRESS"))
//          expect(parametersArr["uc704"]).to(equal("SNAME"))
//          expect(parametersArr["uc702"]).to(equal("NEWSLETTER"))
            expect(parametersArr["oi"]).to(equal("ORDER_NUMBER"))
//          expect(parametersArr["pu"]).to(equal("PAGE_URL"))
//          expect(parametersArr["uc705"]).to(equal("PHONE"))
            expect(parametersArr["ba"]).to(equal("PRODUCT"))
            expect(parametersArr["co"]).to(equal("PRODUCT_COST"))
            expect(parametersArr["qn"]).to(equal("2"))
            expect(parametersArr["st"]).to(equal("conf"))
//          expect(parametersArr["uc711"]).to(equal("STREET"))
//          expect(parametersArr["uc712"]).to(equal("STREETNUMBER"))
            expect(parametersArr["ov"]).to(equal("ORDER_TOTAL"))
            expect(parametersArr["cb563"]).to(equal("VOUCHER_VALUE"))
//          expect(parametersArr["uc710"]).to(equal("ZIP"))
        }
    }

    // MARK: test several parameters track
    func testParameters() {
        if self.mainViewController == nil {
            self.mainViewController = ViewController()
        }

        doURLSendTestAction() {
            self.mainViewController.beginAppearanceTransition(true, animated: false)
            let pageTracker = WebtrekkTracking.trackerForAutotrackedViewController(self.mainViewController)

            WebtrekkTracking.instance().pageURL = nil

            let pageTrackerData = [
                "CURRENCYOver": "CURRENCY",
                "CURRENCY": "GlobalIgnore"
            ]

            for (pageTrackerKey, pageTrackerValue) in pageTrackerData {
                pageTracker[pageTrackerKey] = pageTrackerValue
            }

            let pagePropertiesL = PageProperties(
                name: "pageNameNotauto",
                details: [
                    30: "pageCustom30",
                    31: "pageCustom31"
                ],
                groups: [
                    10: "pageCat10",
                    11: "pageCat11"
                ],
                internalSearch: "InternalSearch",
                url: "http://www.webrekk.com"
            )

            let advertisementPropertiesL = AdvertisementProperties(
                id: "ADVERTISEMENT",
                action: "ADVERTISEMENT_ACTION",
                details: [
                    10: "advertCustom10",
                    11: "advertCustom11"
                ]
            )

            let userPropertiesL = UserProperties(
                birthday: UserProperties.Birthday(
                    day: 11,
                    month: 4,
                    year: 1986
                ),
                city: "CITY",
                country: "COUNTRY",
                details: [
                    10: "userCustomField10"
                ],
                emailAddress: "someaddress@domain.com",
                emailReceiverId: "EMAIL_RID",
                firstName: "GNAME",
                gender: .female,
                id: "userID",
                lastName: "SNAME",
                newsletterSubscribed: false,
                phoneNumber: "123456789",
                street: "STREET",
                streetNumber: "123a",
                zipCode: "10115"
            )

            let ecommercePropertiesL = EcommerceProperties(
                currencyCode: "CURRENCYCodeIgnore",
                details: [
                    10: "ecomeCustomField10"
                ],
                orderNumber: "ORDER_NUMBER",
                products: [
                    EcommerceProperties.Product(
                        name: "productName1",
                        categories: [
                            11: "productCat11",
                            12: "productCat12"
                        ],
                        price: "100",
                        quantity: 1
                    ),
                    EcommerceProperties.Product(
                        name: "productName2",
                        categories: [
                            11: "productCat21",
                            12: "productCat22"
                        ],
                        price: "200",
                        quantity: 2
                    )
                ],
                status: .viewed,
                totalValue: "ORDER_TOTAL",
                voucherValue: "VOUCHER_VALUE"
            )

            let sessionDetailsL = [
                10: "sessionCustom10",
                11: "sessionCustom11"
            ]

            let pageEvent = PageViewEvent(
                pageProperties: pagePropertiesL,
                advertisementProperties: advertisementPropertiesL,
                ecommerceProperties: ecommercePropertiesL,
                sessionDetails: sessionDetailsL,
                userProperties: userPropertiesL
            )

            pageTracker.trackPageView(pageEvent)

            self.mainViewController.endAppearanceTransition()
        }

        doURLSendTestCheck() { parametersArr in
            expect(parametersArr["p"]).to(contain("autoPageName"))
            expect(parametersArr["uc707"]).to(equal("19860411"))
            expect(parametersArr["uc708"]).to(equal("CITY"))
            expect(parametersArr["uc709"]).to(equal("COUNTRY"))
            expect(parametersArr["cr"]).to(equal("CURRENCY"))
            expect(parametersArr["cd"]).to(equal("userID"))
            expect(parametersArr["uc700"]).to(equal("someaddress%40domain.com"))
            expect(parametersArr["uc701"]).to(equal("EMAIL_RID"))
            expect(parametersArr["uc703"]).to(equal("GNAME"))
            expect(parametersArr["uc706"]).to(equal("2"))
            expect(parametersArr["is"]).to(equal("InternalSearch"))
            //expect(parametersArr["X_WT_IP"]).to(equal("IP_ADDRESS"))
            expect(parametersArr["uc704"]).to(equal("SNAME"))
            expect(parametersArr["uc702"]).to(equal("2"))
            expect(parametersArr["oi"]).to(equal("ORDER_NUMBER"))
            expect(parametersArr["pu"]).to(equal("http%3A%2F%2Fwww.webrekk.com"))
            expect(parametersArr["uc705"]).to(equal("123456789"))
            expect(parametersArr["ba"]).to(equal("productName1;productName2"))
            expect(parametersArr["ca11"]).to(equal("productCat11;productCat21"))
            expect(parametersArr["ca12"]).to(equal("productCat12;productCat22"))
            expect(parametersArr["co"]).to(equal("100;200"))
            expect(parametersArr["qn"]).to(equal("1;2"))
            expect(parametersArr["st"]).to(equal("view"))
            expect(parametersArr["uc711"]).to(equal("STREET"))
            expect(parametersArr["uc712"]).to(equal("123a"))
            expect(parametersArr["ov"]).to(equal("ORDER_TOTAL"))
            expect(parametersArr["cb563"]).to(equal("VOUCHER_VALUE"))
            expect(parametersArr["uc710"]).to(equal("10115"))
            expect(parametersArr["uc10"]).to(equal("userCustomField10"))
            expect(parametersArr["cg10"]).to(equal("pageCat10"))
            expect(parametersArr["cg11"]).to(equal("pageCat11"))
            expect(parametersArr["is"]).to(equal("InternalSearch"))
            expect(parametersArr["pu"]).to(equal("http%3A%2F%2Fwww.webrekk.com"))
            expect(parametersArr["cp30"]).to(equal("pageCustom30"))
            expect(parametersArr["cp31"]).to(equal("pageCustom31"))
            expect(parametersArr["mc"]).to(equal("ADVERTISEMENT"))
            expect(parametersArr["mca"]).to(equal("ADVERTISEMENT_ACTION"))
            expect(parametersArr["cc10"]).to(equal("advertCustom10"))
            expect(parametersArr["cc11"]).to(equal("advertCustom11"))
            expect(parametersArr["cs10"]).to(equal("sessionCustom10"))
            expect(parametersArr["cs11"]).to(equal("sessionCustom11"))
        }

        doURLSendTestAction() {
            let tracker = WebtrekkTracking.instance()

//            let globalTrackerData = PageViewEvent(
//                userProperties: UserProperties(
//                    details = [
//                        3: "customUser3"
//                    ]
//                ),
//                sessionDetails: [
//                    1: "shouldBeIgnored"
//                ],
//                pageProperties: PageProperties(
//                    internalSearch: "ShouldBeIgnoredIS"
//                ),
//                advertisementProperties: AdvertisementProperties(
//                    details: [
//                        23: "customAdv23"
//                    ]
//                )
//            )
//
//            for (globalTrackerKey, globalTrackerValue) in globalTrackerData {
//                tracker[globalTrackerKey] = globalTrackerValue
//            }
//
            let trackerData = [
                "CURRENCY": "CURRENCYGlobalParIgnore",
                "INTERN_SEARCH": "InternalSearch"
            ]

            for (trackerKey, trackerValue) in trackerData {
                tracker[trackerKey] = trackerValue
            }

            let pagePropertiesL = PageProperties(
                name: "pageNameNotauto",
                details: [
                    30: "pageCustom30",
                    31: "pageCustom31"
                ],
                groups: [
                    10: "pageCat10",
                    11: "pageCat11"
                ],
                internalSearch: nil,
                url: "http://www.webrekk.com"
            )

            let userPropertiesL = UserProperties(
                birthday: UserProperties.Birthday(
                    day: 11,
                    month: 4,
                    year: 1986
                ),
                city: "CITY",
                country: "COUNTRY",
                details: [
                    10: "userCustomField10"
                ],
                emailAddress: "someaddress@domain.com",
                emailReceiverId: "EMAIL_RID",
                firstName: "GNAME",
                gender: .female,
                id: "userID",
                lastName: "SNAME",
                newsletterSubscribed: false,
                phoneNumber: "123456789",
                street: "STREET",
                streetNumber: "123a",
                zipCode: "10115"
            )

            let advertisementPropertiesL = AdvertisementProperties(
                id: "ADVERTISEMENT",
                action: "ADVERTISEMENT_ACTION",
                details: [
                    10: "advertCustom10",
                    11: "advertCustom11"
                ]
            )

            let ecommercePropertiesL = EcommerceProperties(
                currencyCode: "CURRENCY",
                details: [
                    10: "ecomeCustomField10"
                ],
                orderNumber: "ORDER_NUMBER",
                products: [
                    EcommerceProperties.Product(
                        name: "productName1",
                        categories: [
                            11: "productCat11",
                            12: "productCat12"
                        ],
                        price: "100",
                        quantity: 1
                    ),
                    EcommerceProperties.Product(
                        name: "productName2",
                        categories: [
                            11: "productCat21",
                            12: "productCat22"
                        ],
                        price: "200",
                        quantity: 2
                    )
                ],
                status: .viewed,
                totalValue: "ORDER_TOTAL",
                voucherValue: "VOUCHER_VALUE"
            )

            let sessionDetailsL = [
                10: "sessionCustom10",
                11: "sessionCustom11"
            ]

            let ipAddressL = "IP_ADDRESS"

            let pageEvent = PageViewEvent(
                pageProperties: pagePropertiesL,
                advertisementProperties: advertisementPropertiesL,
                ecommerceProperties: ecommercePropertiesL,
                ipAddress: ipAddressL,
                sessionDetails: sessionDetailsL,
                userProperties: userPropertiesL
            )

            tracker.trackPageView(pageEvent)
        }

        doURLSendTestCheck() { parametersArr in
            expect(parametersArr["p"]).to(contain("pageNameNotauto"))
            expect(parametersArr["uc707"]).to(equal("19860411"))
            expect(parametersArr["uc708"]).to(equal("CITY"))
            expect(parametersArr["uc709"]).to(equal("COUNTRY"))
            expect(parametersArr["cr"]).to(equal("CURRENCY"))
            expect(parametersArr["cd"]).to(equal("userID"))
            expect(parametersArr["uc700"]).to(equal("someaddress%40domain.com"))
            expect(parametersArr["uc701"]).to(equal("EMAIL_RID"))
            expect(parametersArr["uc703"]).to(equal("GNAME"))
            expect(parametersArr["uc706"]).to(equal("2"))
            expect(parametersArr["is"]).to(equal("InternalSearch"))
            //expect(parametersArr["X_WT_IP"]).to(equal("IP_ADDRESS"))
            expect(parametersArr["uc704"]).to(equal("SNAME"))
            expect(parametersArr["uc702"]).to(equal("2"))
            expect(parametersArr["oi"]).to(equal("ORDER_NUMBER"))
            expect(parametersArr["pu"]).to(equal("http%3A%2F%2Fwww.webrekk.com"))
            expect(parametersArr["uc705"]).to(equal("123456789"))
            expect(parametersArr["ba"]).to(equal("productName1;productName2"))
            expect(parametersArr["ca11"]).to(equal("productCat11;productCat21"))
            expect(parametersArr["ca12"]).to(equal("productCat12;productCat22"))
            expect(parametersArr["co"]).to(equal("100;200"))
            expect(parametersArr["qn"]).to(equal("1;2"))
            expect(parametersArr["st"]).to(equal("view"))
            expect(parametersArr["oi"]).to(equal("ORDER_NUMBER"))
            expect(parametersArr["uc711"]).to(equal("STREET"))
            expect(parametersArr["uc712"]).to(equal("123a"))
            expect(parametersArr["ov"]).to(equal("ORDER_TOTAL"))
            expect(parametersArr["cb563"]).to(equal("VOUCHER_VALUE"))
            expect(parametersArr["uc710"]).to(equal("10115"))
            expect(parametersArr["uc10"]).to(equal("userCustomField10"))
            expect(parametersArr["cg10"]).to(equal("pageCat10"))
            expect(parametersArr["cg11"]).to(equal("pageCat11"))
            expect(parametersArr["is"]).to(equal("InternalSearch"))
            expect(parametersArr["pu"]).to(equal("http%3A%2F%2Fwww.webrekk.com"))
            expect(parametersArr["cp30"]).to(equal("pageCustom30"))
            expect(parametersArr["cp31"]).to(equal("pageCustom31"))
            expect(parametersArr["mc"]).to(equal("ADVERTISEMENT"))
            expect(parametersArr["mca"]).to(equal("ADVERTISEMENT_ACTION"))
            expect(parametersArr["cc10"]).to(equal("advertCustom10"))
            expect(parametersArr["cc11"]).to(equal("advertCustom11"))
            expect(parametersArr["cc23"]).to(equal("customAdv23"))
            expect(parametersArr["cs10"]).to(equal("sessionCustom10"))
            expect(parametersArr["cs1"]).to(equal("test_sessionparam1"))
            expect(parametersArr["uc3"]).to(equal("customUser3"))
        }
    }
}
