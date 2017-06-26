!echo '${hivevar:POS_ENV}';
!echo '${hivevar:NEXT_DATE}';
INSERT INTO TABLE ${hivevar:POS_ENV}.fct_sale_staging_trans PARTITION (date_part=${hivevar:NEXT_DATE})
SELECT 
h.DATE_KEY as H_DATE_KEY,
h.STORE_KEY as H_STORE_KEY,
h.TILL_KEY as H_TILL_KEY,
h.INVOICE_NO as H_INVOICE_NO,
h.SALE_INVC_TYPE as H_SALE_INVC_TYPE,
h.CUSTOMER_KEY as H_CUSTOMER_KEY,
h.CASHIER_KEY as H_CASHIER_KEY,
h.TIME_KEY as H_TIME_KEY,
h.STORE_CODE as H_STORE_CODE,
h.FLG_FRANCHISE as H_FLG_FRANCHISE,
h.TILL_CODE as H_TILL_CODE,
h.CUSTOMER_CODE as H_CUSTOMER_CODE,
h.EMPLOYEE_CODE as H_EMPLOYEE_CODE,
h.CASHIER_CODE as H_CASHIER_CODE,
h.SALE_TOT_QTY as H_SALE_TOT_QTY,
h.SALE_NET_VAL as H_SALE_NET_VAL,
h.SALE_RCVD_VAL as H_SALE_RCVD_VAL,
h.SALE_TOT_TAX_VAL as H_SALE_TOT_TAX_VAL,
h.SALE_TOT_DISC_VAL as H_SALE_TOT_DISC_VAL,
h.SALE_TOT_ITEM_COUNT as H_SALE_TOT_ITEM_COUNT,
h.SALE_TOT_PACK_COUNT as H_SALE_TOT_PACK_COUNT,
h.LOYALTY_TRANS_FLG as H_LOYALTY_TRANS_FLG,
h.LOYALTY_BONUS_POINTS as H_LOYALTY_BONUS_POINTS,
h.LOYALTY_STD_POINTS as H_LOYALTY_STD_POINTS,
h.SHIPPING_FEE as H_SHIPPING_FEE,
h.INVOICE_FEE as H_INVOICE_FEE,
h.GENDER as H_GENDER,
h.AGE as H_AGE,
h.ARC_DATE as H_ARC_DATE,
h.INVOICE_DATE as H_INVOICE_DATE,
h.SUB_STORE_CODE as H_SUB_STORE_CODE,
h.CUSTOMER_LOYALTY_CARD as H_CUSTOMER_LOYALTY_CARD,
h.CUSTOMER_GROUP_ID as H_CUSTOMER_GROUP_ID,
h.CUSTOMER_ACCOUNT_NUMBER as H_CUSTOMER_ACCOUNT_NUMBER,
h.SALE_INVC_START as H_SALE_INVC_START,
h.SALE_INVC_END as H_SALE_INVC_END,
h.SUPERVISOR_ID as H_SUPERVISOR_ID,
h.SALE_ORDER_ID as H_SALE_ORDER_ID,
h.ORDER_DATE as H_ORDER_DATE,
h.SESSION_ID as H_SESSION_ID,
h.SOURCE_KEY as H_SOURCE_KEY,
h.ORDER_GEO_LOCATION_KEY as H_ORDER_GEO_LOCATION_KEY,
l.SALE_INVC_TYPE as L_SALE_INVC_TYPE,
l.LINE_NO as L_LINE_NO,
l.STORE_CODE as L_STORE_CODE,
l.PRODUCT_KEY as L_PRODUCT_KEY,
l.PRICE_OVR_REASON_KEY as L_PRICE_OVR_REASON_KEY,
l.SALE_LINE_TYPE as L_SALE_LINE_TYPE,
l.FLG_FRANCHISE as L_FLG_FRANCHISE,
l.PRODUCT_CODE as L_PRODUCT_CODE,
l.TILL_CODE as L_TILL_CODE,
l.PROMOTION_CODE as L_PROMOTION_CODE,
l.DISCOUNT_TYPE_CODE as L_DISCOUNT_TYPE_CODE,
l.RETURN_REASON_CODE as L_RETURN_REASON_CODE,
l.BARCODE as L_BARCODE,
l.SALE_TOT_QTY as L_SALE_TOT_QTY,
l.SALE_NET_VAL as L_SALE_NET_VAL,
l.SALE_TOT_TAX_VAL as L_SALE_TOT_TAX_VAL,
l.SALE_TOT_VAL_AT_PP as L_SALE_TOT_VAL_AT_PP,
l.SALE_TOT_DISC_QTY as L_SALE_TOT_DISC_QTY,
l.SALE_TOT_DISC_VAL as L_SALE_TOT_DISC_VAL,
l.SALE_TOT_GLOBAL_DISC_VAL as L_SALE_TOT_GLOBAL_DISC_VAL,
l.SALE_TOT_GLOBAL_DISC_TAX_VAL as L_SALE_TOT_GLOBAL_DISC_TAX_VAL,
l.PRODUCT_FULL_PRICE as L_PRODUCT_FULL_PRICE,
l.PRODUCT_HO_PRICE as L_PRODUCT_HO_PRICE,
l.ACTUAL_SELLING_PRICE as L_ACTUAL_SELLING_PRICE,
l.SALE_TOT_PACK_COUNT as L_SALE_TOT_PACK_COUNT,
l.MARKDOWN_FLG as L_MARKDOWN_FLG,
l.CODE_KEYED_IN_FLG as L_CODE_KEYED_IN_FLG,
l.PRICE_OVERRIDE_FLG as L_PRICE_OVERRIDE_FLG,
l.PRICE_OVERRIDE_AUTHORIZER as L_PRICE_OVERRIDE_AUTHORIZER,
l.ARC_DATE as L_ARC_DATE,
l.INVOICE_DATE as L_INVOICE_DATE,
l.SUB_STORE_CODE as L_SUB_STORE_CODE,
l.ITEM_ACTUAL_PRICE as L_ITEM_ACTUAL_PRICE,
l.ITEM_ADJUSTED_AMOUNT as L_ITEM_ADJUSTED_AMOUNT,
l.TOTAL_AMOUNT_WITHOUT_LOYALTY as L_TOTAL_AMOUNT_WITHOUT_LOYALTY,
l.ITEM_STD_PRICE as L_ITEM_STD_PRICE,
l.PUMP_SERVER_REF as L_PUMP_SERVER_REF,
l.SERIAL_PROMPT as L_SERIAL_PROMPT,
l.CUSTOMER_LOYALTY_CARD as L_CUSTOMER_LOYALTY_CARD,
l.PUMP_MODE as L_PUMP_MODE,
l.SUB_STATUS_CODE as L_SUB_STATUS_CODE,
l.SUB_STATUS_DESC as L_SUB_STATUS_DESC,
l.TAX_GROUP_1 as L_TAX_GROUP_1,
l.SALE_INVC_START as L_SALE_INVC_START,
l.SALE_INVC_END as L_SALE_INVC_END,
l.DISCOUNT_NAME as L_DISCOUNT_NAME,
l.SALE_TOT_VAL_AT_PP_TCR as L_SALE_TOT_VAL_AT_PP_TCR,
l.TCR_COST as L_TCR_COST,
l.PAYMENT_TYPE_ID as L_PAYMENT_TYPE_ID,
l.PUMP_ID as L_PUMP_ID
from ${hivevar:POS_ENV}.fct_sale_raw_header h
LEFT OUTER JOIN ${hivevar:POS_ENV}.fct_sale_raw_line l on ( h.date_key=l.date_key and h.STORE_KEY=l.STORE_KEY and h.till_key = l.till_key and h.invoice_no=l.invoice_no and l.date_key='${hivevar:NEXT_DATE}' )
where h.date_key='${hivevar:NEXT_DATE}' ;

INSERT INTO TABLE ${hivevar:POS_ENV}.fct_sale_trans PARTITION (date_part=${hivevar:NEXT_DATE})
SELECT
H_DATE_KEY as H_DATE_KEY,
H_STORE_KEY as H_STORE_KEY,
H_TILL_KEY as H_TILL_KEY,
H_INVOICE_NO as H_INVOICE_NO,
H_SALE_INVC_TYPE as H_SALE_INVC_TYPE,
H_CUSTOMER_KEY as H_CUSTOMER_KEY,
H_CASHIER_KEY as H_CASHIER_KEY,
H_TIME_KEY as H_TIME_KEY,
H_STORE_CODE as H_STORE_CODE,
H_FLG_FRANCHISE as H_FLG_FRANCHISE,
H_TILL_CODE as H_TILL_CODE,
H_CUSTOMER_CODE as H_CUSTOMER_CODE,
H_EMPLOYEE_CODE as H_EMPLOYEE_CODE,
H_CASHIER_CODE as H_CASHIER_CODE,
H_SALE_TOT_QTY as H_SALE_TOT_QTY,
H_SALE_NET_VAL as H_SALE_NET_VAL,
H_SALE_RCVD_VAL as H_SALE_RCVD_VAL,
H_SALE_TOT_TAX_VAL as H_SALE_TOT_TAX_VAL,
H_SALE_TOT_DISC_VAL as H_SALE_TOT_DISC_VAL,
H_SALE_TOT_ITEM_COUNT as H_SALE_TOT_ITEM_COUNT,
H_SALE_TOT_PACK_COUNT as H_SALE_TOT_PACK_COUNT,
H_LOYALTY_TRANS_FLG as H_LOYALTY_TRANS_FLG,
H_LOYALTY_BONUS_POINTS as H_LOYALTY_BONUS_POINTS,
H_LOYALTY_STD_POINTS as H_LOYALTY_STD_POINTS,
H_SHIPPING_FEE as H_SHIPPING_FEE,
H_INVOICE_FEE as H_INVOICE_FEE,
H_GENDER as H_GENDER,
H_AGE as H_AGE,
H_ARC_DATE as H_ARC_DATE,
H_INVOICE_DATE as H_INVOICE_DATE,
H_SUB_STORE_CODE as H_SUB_STORE_CODE,
H_CUSTOMER_LOYALTY_CARD as H_CUSTOMER_LOYALTY_CARD,
H_CUSTOMER_GROUP_ID as H_CUSTOMER_GROUP_ID,
H_CUSTOMER_ACCOUNT_NUMBER as H_CUSTOMER_ACCOUNT_NUMBER,
H_SALE_INVC_START as H_SALE_INVC_START,
H_SALE_INVC_END as H_SALE_INVC_END,
H_SUPERVISOR_ID as H_SUPERVISOR_ID,
H_SALE_ORDER_ID as H_SALE_ORDER_ID,
H_ORDER_DATE as H_ORDER_DATE,
H_SESSION_ID as H_SESSION_ID,
H_SOURCE_KEY as H_SOURCE_KEY,
H_ORDER_GEO_LOCATION_KEY as H_ORDER_GEO_LOCATION_KEY,
L_SALE_INVC_TYPE as L_SALE_INVC_TYPE,
L_LINE_NO as L_LINE_NO,
L_STORE_CODE as L_STORE_CODE,
L_PRODUCT_KEY as L_PRODUCT_KEY,
L_PRICE_OVR_REASON_KEY as L_PRICE_OVR_REASON_KEY,
L_SALE_LINE_TYPE as L_SALE_LINE_TYPE,
L_FLG_FRANCHISE as L_FLG_FRANCHISE,
L_PRODUCT_CODE as L_PRODUCT_CODE,
L_TILL_CODE as L_TILL_CODE,
L_PROMOTION_CODE as L_PROMOTION_CODE,
L_DISCOUNT_TYPE_CODE as L_DISCOUNT_TYPE_CODE,
L_RETURN_REASON_CODE as L_RETURN_REASON_CODE,
L_BARCODE as L_BARCODE,
L_SALE_TOT_QTY as L_SALE_TOT_QTY,
L_SALE_NET_VAL as L_SALE_NET_VAL,
L_SALE_TOT_TAX_VAL as L_SALE_TOT_TAX_VAL,
L_SALE_TOT_VAL_AT_PP as L_SALE_TOT_VAL_AT_PP,
L_SALE_TOT_DISC_QTY as L_SALE_TOT_DISC_QTY,
L_SALE_TOT_DISC_VAL as L_SALE_TOT_DISC_VAL,
L_SALE_TOT_GLOBAL_DISC_VAL as L_SALE_TOT_GLOBAL_DISC_VAL,
L_SALE_TOT_GLOBAL_DISC_TAX_VAL as L_SALE_TOT_GLOBAL_DISC_TAX_VAL,
L_PRODUCT_FULL_PRICE as L_PRODUCT_FULL_PRICE,
L_PRODUCT_HO_PRICE as L_PRODUCT_HO_PRICE,
L_ACTUAL_SELLING_PRICE as L_ACTUAL_SELLING_PRICE,
L_SALE_TOT_PACK_COUNT as L_SALE_TOT_PACK_COUNT,
L_MARKDOWN_FLG as L_MARKDOWN_FLG,
L_CODE_KEYED_IN_FLG as L_CODE_KEYED_IN_FLG,
L_PRICE_OVERRIDE_FLG as L_PRICE_OVERRIDE_FLG,
L_PRICE_OVERRIDE_AUTHORIZER as L_PRICE_OVERRIDE_AUTHORIZER,
L_ARC_DATE as L_ARC_DATE,
L_INVOICE_DATE as L_INVOICE_DATE,
L_SUB_STORE_CODE as L_SUB_STORE_CODE,
L_ITEM_ACTUAL_PRICE as L_ITEM_ACTUAL_PRICE,
L_ITEM_ADJUSTED_AMOUNT as L_ITEM_ADJUSTED_AMOUNT,
L_TOTAL_AMOUNT_WITHOUT_LOYALTY as L_TOTAL_AMOUNT_WITHOUT_LOYALTY,
L_ITEM_STD_PRICE as L_ITEM_STD_PRICE,
L_PUMP_SERVER_REF as L_PUMP_SERVER_REF,
L_SERIAL_PROMPT as L_SERIAL_PROMPT,
L_CUSTOMER_LOYALTY_CARD as L_CUSTOMER_LOYALTY_CARD,
L_PUMP_MODE as L_PUMP_MODE,
L_SUB_STATUS_CODE as L_SUB_STATUS_CODE,
L_SUB_STATUS_DESC as L_SUB_STATUS_DESC,
L_TAX_GROUP_1 as L_TAX_GROUP_1,
L_SALE_INVC_START as L_SALE_INVC_START,
L_SALE_INVC_END as L_SALE_INVC_END,
L_DISCOUNT_NAME as L_DISCOUNT_NAME,
L_SALE_TOT_VAL_AT_PP_TCR as L_SALE_TOT_VAL_AT_PP_TCR,
L_TCR_COST as L_TCR_COST,
L_PAYMENT_TYPE_ID as L_PAYMENT_TYPE_ID,
L_PUMP_ID as L_PUMP_ID
from ${hivevar:POS_ENV}.fct_sale_staging_trans where date_part='${hivevar:NEXT_DATE}' order by H_store_key, L_product_key;
