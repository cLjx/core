clc;clear all
ditubZ=[304.8286 29.7 106.7
325.95767 29.702 106.7
287.91022 29.705 106.7
312.56494 29.707 106.7
313.89746 29.71 106.7
274.80826 29.712 106.7
288.50266 29.714 106.7
276.07193 29.717 106.7
262.09164 29.719 106.7
253.41753 29.721 106.7
269.4801 29.724 106.7
273.4714 29.726 106.7
248.94756 29.729 106.7
230.53148 29.731 106.7
212.68173 29.733 106.7
218.54869 29.736 106.7
238.26483 29.738 106.7
244.20374 29.74 106.7
267.41263 29.743 106.7
323.26624 29.745 106.7
388.79422 29.748 106.7
377.5127 29.75 106.7
386.11188 29.7 106.702
384.59662 29.702 106.702
318.49097 29.705 106.702
338.49347 29.707 106.702
297.11505 29.71 106.702
282.27045 29.712 106.702
321.44745 29.714 106.702
280.4653 29.717 106.702
298.82767 29.719 106.702
263.97406 29.721 106.702
275.13693 29.724 106.702
282.44412 29.726 106.702
255.5296 29.729 106.702
269.05878 29.731 106.702
266.72754 29.733 106.702
219.8739 29.736 106.702
208.42525 29.738 106.702
208.7227 29.74 106.702
223.2076 29.743 106.702
249.72023 29.745 106.702
317.53354 29.748 106.702
341.18655 29.75 106.702
484.93533 29.7 106.705
490.35706 29.702 106.705
417.2894 29.705 106.705
444.68 29.707 106.705
358.4263 29.71 106.705
342.07352 29.712 106.705
317.61975 29.714 106.705
301.69437 29.717 106.705
289.61102 29.719 106.705
279.7382 29.721 106.705
318.11978 29.724 106.705
296.91293 29.726 106.705
305.86386 29.729 106.705
289.9394 29.731 106.705
278.86462 29.733 106.705
248.88124 29.736 106.705
233.93826 29.738 106.705
222.80215 29.74 106.705
211.38193 29.743 106.705
211.72522 29.745 106.705
230.00241 29.748 106.705
245.36646 29.75 106.705
568.02936 29.7 106.707
499.71164 29.702 106.707
488.6334 29.705 106.707
515.6609 29.707 106.707
414.2449 29.71 106.707
418.63364 29.712 106.707
350.55466 29.714 106.707
327.60007 29.717 106.707
330.44913 29.719 106.707
298.27048 29.721 106.707
301.14667 29.724 106.707
328.49338 29.726 106.707
338.25577 29.729 106.707
318.2638 29.731 106.707
284.581 29.733 106.707
268.15634 29.736 106.707
261.70193 29.738 106.707
252.9714 29.74 106.707
239.68515 29.743 106.707
223.82487 29.745 106.707
212.11394 29.748 106.707
214.25908 29.75 106.707
561.5937 29.7 106.71
552.5741 29.702 106.71
599.0661 29.705 106.71
541.8046 29.707 106.71
520.97107 29.71 106.71
470.4197 29.712 106.71
476.49857 29.714 106.71
407.62756 29.717 106.71
419.35193 29.719 106.71
398.70596 29.721 106.71
344.16153 29.724 106.71
339.10773 29.726 106.71
320.57236 29.729 106.71
346.58768 29.731 106.71
325.79898 29.733 106.71
296.9929 29.736 106.71
275.0016 29.738 106.71
252.00958 29.74 106.71
242.24347 29.743 106.71
259.90237 29.745 106.71
276.40952 29.748 106.71
235.96356 29.75 106.71
517.3796 29.7 106.712
517.7538 29.702 106.712
621.30383 29.705 106.712
565.7821 29.707 106.712
574.6942 29.71 106.712
519.8015 29.712 106.712
534.7162 29.714 106.712
485.41187 29.717 106.712
512.1123 29.719 106.712
447.58008 29.721 106.712
414.57465 29.724 106.712
378.36246 29.726 106.712
333.6808 29.729 106.712
313.70013 29.731 106.712
297.2147 29.733 106.712
329.1557 29.736 106.712
286.20956 29.738 106.712
260.81274 29.74 106.712
239.82567 29.743 106.712
249.34682 29.745 106.712
261.52002 29.748 106.712
232.82451 29.75 106.712
490.95932 29.7 106.714
504.3103 29.702 106.714
564.24603 29.705 106.714
582.0428 29.707 106.714
578.6524 29.71 106.714
583.0984 29.712 106.714
574.6792 29.714 106.714
581.44257 29.717 106.714
537.9888 29.719 106.714
462.74332 29.721 106.714
492.23825 29.724 106.714
441.72134 29.726 106.714
378.01575 29.729 106.714
346.34543 29.731 106.714
339.36517 29.733 106.714
301.69476 29.736 106.714
273.18103 29.738 106.714
310.44962 29.74 106.714
268.30383 29.743 106.714
253.7861 29.745 106.714
242.54669 29.748 106.714
251.78598 29.75 106.714
504.82996 29.7 106.717
508.46136 29.702 106.717
553.46014 29.705 106.717
553.1065 29.707 106.717
574.5457 29.71 106.717
552.16724 29.712 106.717
533.6377 29.714 106.717
620.0967 29.717 106.717
579.1831 29.719 106.717
532.13135 29.721 106.717
556.4638 29.724 106.717
486.73203 29.726 106.717
483.993 29.729 106.717
413.19458 29.731 106.717
424.24622 29.733 106.717
371.51837 29.736 106.717
312.36578 29.738 106.717
312.51733 29.74 106.717
312.76566 29.743 106.717
283.0661 29.745 106.717
276.1605 29.748 106.717
263.2865 29.75 106.717
513.90717 29.7 106.719
520.29126 29.702 106.719
561.9211 29.705 106.719
540.60425 29.707 106.719
551.272 29.71 106.719
529.49664 29.712 106.719
528.5037 29.714 106.719
567.8725 29.717 106.719
571.2684 29.719 106.719
555.8627 29.721 106.719
579.1234 29.724 106.719
518.8174 29.726 106.719
525.3392 29.729 106.719
463.597 29.731 106.719
506.32108 29.733 106.719
414.88568 29.736 106.719
330.8756 29.738 106.719
362.48248 29.74 106.719
302.9767 29.743 106.719
303.5127 29.745 106.719
287.49728 29.748 106.719
293.44235 29.75 106.719
523.7967 29.7 106.721
508.11014 29.702 106.721
543.4614 29.705 106.721
533.01434 29.707 106.721
563.46594 29.71 106.721
522.66736 29.712 106.721
519.8503 29.714 106.721
530.7548 29.717 106.721
534.42065 29.719 106.721
546.21014 29.721 106.721
603.76636 29.724 106.721
599.4044 29.726 106.721
564.8967 29.729 106.721
552.8408 29.731 106.721
561.0113 29.733 106.721
434.87036 29.736 106.721
412.67285 29.738 106.721
416.30978 29.74 106.721
322.49582 29.743 106.721
339.4522 29.745 106.721
300.45288 29.748 106.721
312.15665 29.75 106.721
546.0676 29.7 106.724
539.1915 29.702 106.724
512.4629 29.705 106.724
512.7266 29.707 106.724
522.77924 29.71 106.724
518.4475 29.712 106.724
536.361 29.714 106.724
552.76117 29.717 106.724
529.2051 29.719 106.724
528.1324 29.721 106.724
551.93066 29.724 106.724
609.2742 29.726 106.724
653.8756 29.729 106.724
649.7458 29.731 106.724
600.94635 29.733 106.724
520.64624 29.736 106.724
542.2873 29.738 106.724
484.50854 29.74 106.724
396.3713 29.743 106.724
421.36328 29.745 106.724
361.89395 29.748 106.724
328.14587 29.75 106.724
551.9079 29.7 106.726
574.28503 29.702 106.726
532.48096 29.705 106.726
543.03326 29.707 106.726
540.1445 29.71 106.726
514.4233 29.712 106.726
556.28503 29.714 106.726
550.50586 29.717 106.726
559.5741 29.719 106.726
564.9399 29.721 106.726
536.99207 29.724 106.726
571.2071 29.726 106.726
609.85156 29.729 106.726
677.9044 29.731 106.726
668.29645 29.733 106.726
591.09503 29.736 106.726
577.90967 29.738 106.726
529.254 29.74 106.726
482.54977 29.743 106.726
474.84906 29.745 106.726
405.41565 29.748 106.726
359.62662 29.75 106.726
495.10056 29.7 106.729
512.4942 29.702 106.729
592.47473 29.705 106.729
568.64545 29.707 106.729
547.09296 29.71 106.729
535.03076 29.712 106.729
517.805 29.714 106.729
530.4945 29.717 106.729
533.3302 29.719 106.729
553.85864 29.721 106.729
584.89343 29.724 106.729
564.0296 29.726 106.729
560.5842 29.729 106.729
604.0932 29.731 106.729
619.52997 29.733 106.729
696.0273 29.736 106.729
641.3913 29.738 106.729
671.35095 29.74 106.729
597.288 29.743 106.729
563.5249 29.745 106.729
485.0032 29.748 106.729
458.31924 29.75 106.729
434.79572 29.7 106.731
450.55884 29.702 106.731
514.3839 29.705 106.731
541.02734 29.707 106.731
607.1707 29.71 106.731
568.933 29.712 106.731
548.24146 29.714 106.731
523.6057 29.717 106.731
534.8989 29.719 106.731
553.8065 29.721 106.731
576.0136 29.724 106.731
567.80194 29.726 106.731
557.00916 29.729 106.731
562.5406 29.731 106.731
572.4058 29.733 106.731
676.01855 29.736 106.731
724.4018 29.738 106.731
716.8046 29.74 106.731
673.07056 29.743 106.731
642.6725 29.745 106.731
510.37054 29.748 106.731
553.7695 29.75 106.731
365.9776 29.7 106.733
397.0092 29.702 106.733
446.78375 29.705 106.733
487.34964 29.707 106.733
554.8229 29.71 106.733
583.52496 29.712 106.733
588.2972 29.714 106.733
532.23474 29.717 106.733
551.5445 29.719 106.733
574.2696 29.721 106.733
545.2008 29.724 106.733
565.0257 29.726 106.733
578.05927 29.729 106.733
548.3592 29.731 106.733
558.7554 29.733 106.733
667.13745 29.736 106.733
717.13947 29.738 106.733
701.5304 29.74 106.733
727.6059 29.743 106.733
659.9425 29.745 106.733
600.3587 29.748 106.733
617.0386 29.75 106.733
315.02737 29.7 106.736
341.46616 29.702 106.736
339.25662 29.705 106.736
398.84164 29.707 106.736
457.4899 29.71 106.736
516.11255 29.712 106.736
510.98642 29.714 106.736
554.7614 29.717 106.736
548.3244 29.719 106.736
523.8851 29.721 106.736
554.1223 29.724 106.736
564.9465 29.726 106.736
558.1931 29.729 106.736
542.2792 29.731 106.736
547.7542 29.733 106.736
595.9354 29.736 106.736
619.8915 29.738 106.736
603.80444 29.74 106.736
682.63324 29.743 106.736
632.60095 29.745 106.736
716.6487 29.748 106.736
728.52356 29.75 106.736
307.17517 29.7 106.738
314.42426 29.702 106.738
321.1115 29.705 106.738
343.73956 29.707 106.738
408.94598 29.71 106.738
440.5174 29.712 106.738
438.5352 29.714 106.738
537.6246 29.717 106.738
500.357 29.719 106.738
520.501 29.721 106.738
531.9406 29.724 106.738
532.42395 29.726 106.738
536.1245 29.729 106.738
540.2112 29.731 106.738
561.4955 29.733 106.738
562.0604 29.736 106.738
573.0901 29.738 106.738
585.8341 29.74 106.738
639.1857 29.743 106.738
619.6057 29.745 106.738
734.93427 29.748 106.738
791.96655 29.75 106.738
289.62335 29.7 106.74
286.49448 29.702 106.74
325.11313 29.705 106.74
320.24973 29.707 106.74
360.64 29.71 106.74
368.6149 29.712 106.74
402.50464 29.714 106.74
454.6642 29.717 106.74
446.11047 29.719 106.74
522.9772 29.721 106.74
562.2746 29.724 106.74
542.07886 29.726 106.74
542.7598 29.729 106.74
544.63806 29.731 106.74
569.32104 29.733 106.74
566.4996 29.736 106.74
587.6865 29.738 106.74
604.2721 29.74 106.74
618.5895 29.743 106.74
600.20807 29.745 106.74
720.96625 29.748 106.74
766.3239 29.75 106.74
278.9373 29.7 106.743
265.2852 29.702 106.743
309.60165 29.705 106.743
282.48114 29.707 106.743
308.69388 29.71 106.743
343.67896 29.712 106.743
347.65714 29.714 106.743
347.91177 29.717 106.743
396.27103 29.719 106.743
476.95502 29.721 106.743
491.55978 29.724 106.743
536.36505 29.726 106.743
571.8 29.729 106.743
551.79205 29.731 106.743
563.7734 29.733 106.743
579.8481 29.736 106.743
569.39667 29.738 106.743
612.3375 29.74 106.743
583.4764 29.743 106.743
581.1283 29.745 106.743
666.00323 29.748 106.743
674.80115 29.75 106.743
253.97586 29.7 106.745
254.89381 29.702 106.745
269.57364 29.705 106.745
260.8505 29.707 106.745
284.04907 29.71 106.745
295.93924 29.712 106.745
323.9174 29.714 106.745
333.25262 29.717 106.745
379.514 29.719 106.745
422.5542 29.721 106.745
439.31708 29.724 106.745
529.3711 29.726 106.745
580.9503 29.729 106.745
577.253 29.731 106.745
551.88873 29.733 106.745
560.139 29.736 106.745
560.63995 29.738 106.745
573.2474 29.74 106.745
548.5229 29.743 106.745
573.55444 29.745 106.745
618.8902 29.748 106.745
631.0934 29.75 106.745
286.70404 29.7 106.748
280.79602 29.702 106.748
244.37234 29.705 106.748
251.43872 29.707 106.748
266.88266 29.71 106.748
300.68228 29.712 106.748
309.1586 29.714 106.748
347.7302 29.717 106.748
349.84775 29.719 106.748
351.56866 29.721 106.748
412.09808 29.724 106.748
470.57852 29.726 106.748
497.8283 29.729 106.748
503.941 29.731 106.748
563.90576 29.733 106.748
591.66986 29.736 106.748
565.39856 29.738 106.748
578.00653 29.74 106.748
539.1085 29.743 106.748
548.3446 29.745 106.748
578.42334 29.748 106.748
580.3899 29.75 106.748
280.6151 29.7 106.75
288.6629 29.702 106.75
282.79208 29.705 106.75
256.04892 29.707 106.75
250.69632 29.71 106.75
286.75668 29.712 106.75
300.12082 29.714 106.75
330.2469 29.717 106.75
325.7407 29.719 106.75
337.83365 29.721 106.75
397.9693 29.724 106.75
399.56775 29.726 106.75
425.10184 29.729 106.75
431.58734 29.731 106.75
529.45966 29.733 106.75
562.3873 29.736 106.75
567.7627 29.738 106.75
547.8999 29.74 106.75
548.41504 29.743 106.75
564.7458 29.745 106.75
586.3609 29.748 106.75
558.8647 29.75 106.75
];
dituZ=reshape(ditubZ(:,1),22,22);
dituZ1=dituZ;
dituZx=ditubZ(1:22,2);
dituZy=ditubZ(1:22:end,3);
mesh(dituZ)