

WITH raw AS (
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/13/AAPL_20250413_111406_6ss1g0.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/13/AAPL_20250413_111507_vbodha.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/13/AAPL_20250413_111607_fg6ikl.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/13/AAPL_20250413_111707_meu1bb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/17/AAPL_20250417_225502_nbggac.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/17/AAPL_20250417_225604_fpbwvo.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/17/AAPL_20250417_225706_mdcj3j.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/17/AAPL_20250417_235559_wnml5g.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AAPL/2025/4/26/AAPL_20250426_004219_mwpj6f.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AMGN/2025/4/13/AMGN_20250413_111406_376tdf.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AMGN/2025/4/13/AMGN_20250413_111707_6fyizj.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AMGN/2025/4/13/AMGN_20250413_111807_wj4725.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AMGN/2025/4/13/AMGN_20250413_111908_grof48.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AMGN/2025/4/13/AMGN_20250413_112008_mqcblg.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AMGN/2025/4/13/AMGN_20250413_112430_vzl3jo.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AXP/2025/4/13/AXP_20250413_112043_rxe487.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AXP/2025/4/13/AXP_20250413_112143_dy2f99.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AXP/2025/4/13/AXP_20250413_112243_wpjnea.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AXP/2025/4/13/AXP_20250413_112343_3ar95s.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AXP/2025/4/13/AXP_20250413_112820_nmp10g.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/AXP/2025/4/25/AXP_20250425_234418_obn9mz.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/BA/2025/4/13/BA_20250413_112430_qjgzy0.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/BA/2025/4/13/BA_20250413_112530_xlerhn.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/BA/2025/4/13/BA_20250413_112630_ulftgu.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/BA/2025/4/13/BA_20250413_112730_hfrte0.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/BA/2025/4/13/BA_20250413_113208_zvt53x.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/13/CAT_20250413_112820_v57z9v.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/13/CAT_20250413_112920_sljvdt.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/13/CAT_20250413_113020_hw41p1.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/13/CAT_20250413_113120_ykrdew.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/13/CAT_20250413_113555_97ycfk.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/25/CAT_20250425_234308_eat6ce.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CAT/2025/4/25/CAT_20250425_234418_3ls2mb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/13/CRM_20250413_113208_xkovti.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/13/CRM_20250413_113308_mgza12.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/13/CRM_20250413_113408_9bqr6q.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/13/CRM_20250413_113508_k34vp2.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/13/CRM_20250413_113945_lkclxc.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/25/CRM_20250425_234327_cuoq2f.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CRM/2025/4/25/CRM_20250425_234427_sh1tth.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/13/CSCO_20250413_113555_l9kwg7.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/13/CSCO_20250413_113655_izivyy.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/13/CSCO_20250413_113755_dt1x9y.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/13/CSCO_20250413_113855_c3r2g8.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/13/CSCO_20250413_114723_2fm9vb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/25/CSCO_20250425_234418_ic47ef.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CSCO/2025/4/25/CSCO_20250425_234520_q0ghqd.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CVX/2025/4/13/CVX_20250413_113945_jz58k4.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CVX/2025/4/13/CVX_20250413_114046_wfeslb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CVX/2025/4/13/CVX_20250413_114146_gr7ke4.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CVX/2025/4/13/CVX_20250413_114246_nnct9l.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CVX/2025/4/13/CVX_20250413_114346_ft4rmb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/CVX/2025/4/25/CVX_20250425_234427_b8g096.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/13/DIS_20250413_114346_oo2o7g.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/13/DIS_20250413_114447_00dzv2.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/13/DIS_20250413_114547_celsbg.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/13/DIS_20250413_114647_l29qvy.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/13/DIS_20250413_122154_00kf9h.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/25/DIS_20250425_234427_xttpg7.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DIS/2025/4/25/DIS_20250425_234703_dazyq7.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/13/DOW_20250413_114723_5js7wg.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/13/DOW_20250413_114823_ikbq60.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/13/DOW_20250413_114924_v4k4vs.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/13/DOW_20250413_115024_t1ze5o.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/13/DOW_20250413_115124_z0yaap.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/25/DOW_20250425_234520_z0xwpx.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/DOW/2025/4/25/DOW_20250425_234640_i1dozz.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/13/GS_20250413_115124_k5wp1c.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/13/GS_20250413_115224_up2h60.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/13/GS_20250413_115324_kvaybg.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/13/GS_20250413_115424_p826ac.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/13/GS_20250413_115524_kaslf9.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/25/GS_20250425_234520_55r2co.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/25/GS_20250425_234640_vlqhzk.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/GS/2025/4/25/GS_20250425_235039_r86zaf.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HD/2025/4/13/HD_20250413_115524_v565zl.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HD/2025/4/13/HD_20250413_115624_m2ddoc.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HD/2025/4/13/HD_20250413_115725_r0w0oc.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HD/2025/4/13/HD_20250413_115825_ohauqk.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HD/2025/4/13/HD_20250413_115925_52bquj.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HD/2025/4/25/HD_20250425_235039_5cdo64.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HON/2025/4/13/HON_20250413_115925_m22v5u.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HON/2025/4/13/HON_20250413_120025_p6isvb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HON/2025/4/13/HON_20250413_120125_j4tlsk.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HON/2025/4/13/HON_20250413_120225_jxmz5t.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HON/2025/4/13/HON_20250413_120325_yjx3h3.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/HON/2025/4/25/HON_20250425_235039_i5yclz.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/IBM/2025/4/13/IBM_20250413_120326_5v31ap.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/IBM/2025/4/13/IBM_20250413_120426_v0zxjs.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/IBM/2025/4/13/IBM_20250413_120526_t0aet0.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/IBM/2025/4/13/IBM_20250413_120626_1mh4pe.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/IBM/2025/4/13/IBM_20250413_120726_q9scqg.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/IBM/2025/4/25/IBM_20250425_235039_8vjty5.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/INTC/2025/4/13/INTC_20250413_120726_tngyf4.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/INTC/2025/4/13/INTC_20250413_120827_pa0hww.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/INTC/2025/4/13/INTC_20250413_120927_n0bjos.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/INTC/2025/4/13/INTC_20250413_121027_6cnq4f.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/INTC/2025/4/13/INTC_20250413_121127_8gcjaq.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/INTC/2025/4/25/INTC_20250425_235039_rp8rq4.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JNJ/2025/4/13/JNJ_20250413_121027_d7pymv.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JNJ/2025/4/13/JNJ_20250413_121127_1unfa3.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JNJ/2025/4/13/JNJ_20250413_121227_0in9gv.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JNJ/2025/4/13/JNJ_20250413_121327_n72dcw.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JNJ/2025/4/13/JNJ_20250413_121428_77t0e9.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JNJ/2025/4/25/JNJ_20250425_235039_wk68wk.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/13/JPM_20250413_121428_2nx47p.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/13/JPM_20250413_121528_lbr75v.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/13/JPM_20250413_121628_an9e86.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/13/JPM_20250413_121728_jbj8pq.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/13/JPM_20250413_121828_lzta1f.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/25/JPM_20250425_234640_mk9rdq.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/JPM/2025/4/25/JPM_20250425_234813_6mlgw4.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/KO/2025/4/13/KO_20250413_121828_giyj1f.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/KO/2025/4/13/KO_20250413_121929_r2lpld.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/KO/2025/4/13/KO_20250413_122029_19yvzy.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/KO/2025/4/13/KO_20250413_122129_nxv1nm.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/KO/2025/4/13/KO_20250413_123717_4aowb0.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/KO/2025/4/25/KO_20250425_234813_tfe6zz.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/13/MCD_20250413_122155_xjyi4f.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/13/MCD_20250413_122255_zxb6im.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/13/MCD_20250413_122355_1o2rjj.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/13/MCD_20250413_122455_sw660e.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/13/MCD_20250413_122555_bxprrb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/25/MCD_20250425_234703_v3zxd2.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MCD/2025/4/25/MCD_20250425_234812_wz41kk.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MMM/2025/4/13/MMM_20250413_122555_v35yhq.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MMM/2025/4/13/MMM_20250413_122655_3v0frs.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MMM/2025/4/13/MMM_20250413_122755_yq3rsw.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MMM/2025/4/13/MMM_20250413_122856_urd0jv.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MMM/2025/4/13/MMM_20250413_122956_1sygy4.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MMM/2025/4/25/MMM_20250425_234812_f93hmr.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/13/MRK_20250413_122956_f3ddtt.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/13/MRK_20250413_123056_1vzpgv.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/13/MRK_20250413_123156_a4xt7c.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/13/MRK_20250413_123257_24je3z.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/13/MRK_20250413_123357_t7dxcs.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/25/MRK_20250425_234812_h8foyr.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MRK/2025/4/25/MRK_20250425_234934_68pr77.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MSFT/2025/4/13/MSFT_20250413_123357_pxhd4g.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MSFT/2025/4/13/MSFT_20250413_123457_3lr87y.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MSFT/2025/4/13/MSFT_20250413_123557_xcbu21.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MSFT/2025/4/13/MSFT_20250413_123658_vsbw42.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/MSFT/2025/4/25/MSFT_20250425_234934_jq59fm.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/13/NKE_20250413_123717_ewnsex.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/13/NKE_20250413_123817_bh1dtd.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/13/NKE_20250413_123917_5fp936.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/13/NKE_20250413_124017_z26lw1.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/13/NKE_20250413_124118_5pioe2.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/13/NKE_20250413_124218_3qjysz.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/25/NKE_20250425_234813_kvpqck.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/NKE/2025/4/25/NKE_20250425_234918_m0sl99.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/PG/2025/4/13/PG_20250413_124118_egc4nt.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/PG/2025/4/13/PG_20250413_124218_l9dtbw.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/PG/2025/4/13/PG_20250413_210538_qf1xkp.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/PG/2025/4/25/PG_20250425_234918_hjrmhf.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/TRV/2025/4/25/TRV_20250425_235039_45wqpb.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/V/2025/4/25/V_20250425_234918_5oj94r.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/V/2025/4/25/V_20250425_235039_l37ne1.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/VZ/2025/4/25/VZ_20250425_234934_4iwkej.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/VZ/2025/4/26/VZ_20250426_004219_5q0wv1.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/WBA/2025/4/25/WBA_20250425_235039_1pst4j.json')
    UNION ALL
    SELECT * FROM read_json_auto('http://localhost:9000/my-stock-data-bucket/stocks/WBA/2025/4/25/WBA_20250425_235221_jdahc0.json')
)

SELECT
    CAST(symbol AS TEXT) AS symbol,
    CAST(datetime AS TIMESTAMP) AS datetime,
    CAST(open AS DOUBLE) AS open,
    CAST(high AS DOUBLE) AS high,
    CAST(low AS DOUBLE) AS low,
    CAST(close AS DOUBLE) AS close,
    CAST(volume AS BIGINT) AS volume
FROM raw
WHERE symbol IS NOT NULL AND datetime IS NOT NULL