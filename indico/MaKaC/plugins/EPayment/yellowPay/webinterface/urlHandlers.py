# -*- coding: utf-8 -*-
##
##
## This file is part of Indico.
## Copyright (C) 2002 - 2013 European Organization for Nuclear Research (CERN).
##
## Indico is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 3 of the
## License, or (at your option) any later version.
##
## Indico is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Indico;if not, see <http://www.gnu.org/licenses/>.

from MaKaC.webinterface.urlHandlers import URLHandler as MainURLHandler

from MaKaC.plugins.EPayment.yellowPay import MODULE_ID


class EPURLHandler(MainURLHandler):
    
    _requestTag = ""
    
    def getURL( cls, target=None ):
        """Gives the full URL for the corresponding request handler. In case
            the target parameter is specified it will append to the URL the 
            the necessary parameters to make the target be specified in the url.
            
            Parameters:
                target - (Locable) Target object which must be uniquely 
                    specified in the URL so the destination request handler
                    is able to retrieve it. 
        """
        #url = MainURLHandler.getURL(target)
        url = cls._getURL()
        if target is not None:
            url.setParams( target.getLocator() )
        url.addParam( "EPaymentName", MODULE_ID )
        url.addParam( "requestTag", cls._requestTag )
        return url
    getURL = classmethod( getURL )

class UHConfModifEPayment(EPURLHandler):
    _relativeURL = "confModifEpayment.py/modifModule"

class UHConfModifEPaymentYellowPay( UHConfModifEPayment ):
    _requestTag = "modifYellowPay"  
class UHConfModifEPaymentYellowPayDataModif( UHConfModifEPayment ):
    _requestTag = "modifYellowPayData"    
class UHConfModifEPaymentYellowPayPerformDataModif( UHConfModifEPayment ):
    _requestTag = "modifYellowPayPerformDataModif"      


class UHPay(EPURLHandler):
    _relativeURL = "payment.py"
    
class UHPayConfirmYellowPay( UHPay ):
    _requestTag = "effectuer"      
class UHPayNotconfirmYellowPay( UHPay ):
    _requestTag = "noneffectuer"      
class UHPayCancelYellowPay( UHPay ):
    _requestTag = "annuler"        
class UHPayParamsYellowPay( UHPay ):
    _requestTag = "params"  



