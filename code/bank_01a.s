.include "includes.s"
        
.bank $01a slot 3
.org $0

CompressedData_00:
	.incbin "data/compressed_0d0000.bin"

CompressedData_01:
	.incbin "data/compressed_0d030c.bin"

CompressedData_02:
	.incbin "data/compressed_0d083e.bin"

CompressedData_03:
	.incbin "data/compressed_0d0df6.bin"

CompressedData_04:
	.incbin "data/compressed_0d1382.bin"

CompressedData_05:
	.incbin "data/compressed_0d1694.bin"

CompressedData_06:
	.incbin "data/compressed_0d1cc7.bin"

CompressedData_07:
	.incbin "data/compressed_0d2329.bin"

CompressedData_08:
	.incbin "data/compressed_0d2624.bin"

CompressedData_09:
	.incbin "data/compressed_0d28f7.bin"

CompressedData_0a:
	.incbin "data/compressed_0d2b89.bin"

CompressedData_0b:
	.incbin "data/compressed_0d377d.bin"

CompressedData_0c:
	.incbin "data/compressed_0d378d.bin" READ $4873

.bank $01b slot 3
.org $0

	.incbin "data/compressed_0d378d.bin" SKIP $4873

CompressedData_0d:
	.incbin "data/compressed_0d9682.bin"

CompressedData_0e:
	.incbin "data/compressed_0dea9c.bin" READ $1564

.bank $01c slot 3
.org $0

	.incbin "data/compressed_0dea9c.bin" SKIP $1564

CompressedData_0f:
	.incbin "data/compressed_0e1ca4.bin"

CompressedData_10:
	.incbin "data/compressed_0e2307.bin"

CompressedData_11:
	.incbin "data/compressed_0e791a.bin"

CompressedData_12:
	.incbin "data/compressed_0e7df4.bin" READ $020c

.bank $01d slot 3
.org $0

	.incbin "data/compressed_0e7df4.bin" SKIP $020c

CompressedData_13:
	.incbin "data/compressed_0e84b3.bin"

CompressedData_14:
	.incbin "data/compressed_0e9fc3.bin"

CompressedData_15:
	.incbin "data/compressed_0ea19c.bin"

CompressedData_16:
	.incbin "data/compressed_0ea9af.bin"

CompressedData_17:
	.incbin "data/compressed_0eae54.bin"

CompressedData_18:
	.incbin "data/compressed_0eafb9.bin"

CompressedData_19:
	.incbin "data/compressed_0eb28e.bin"

CompressedData_1a:
	.incbin "data/compressed_0eb378.bin"

CompressedData_1b:
	.incbin "data/compressed_0eba5e.bin" READ $45a2

.bank $01e slot 3
.org $0

	.incbin "data/compressed_0eba5e.bin" SKIP $45a2

CompressedData_1c:
	.incbin "data/compressed_0f03ab.bin"

CompressedData_1d:
	.incbin "data/compressed_0f4284.bin"

CompressedData_1e:
	.incbin "data/compressed_0f56f3.bin"

CompressedData_1f:
	.incbin "data/compressed_0f6085.bin"

CompressedData_20:
	.incbin "data/compressed_0f7836.bin" READ $07ca

.bank $01f slot 3
.org $0

	.incbin "data/compressed_0f7836.bin" SKIP $07ca

CompressedData_21:
	.incbin "data/compressed_0f85e5.bin"

CompressedData_22:
	.incbin "data/compressed_0f8bd8.bin"

CompressedData_23:
	.incbin "data/compressed_0f8bdb.bin"

CompressedData_24:
	.incbin "data/compressed_0fa068.bin"

CompressedData_25:
	.incbin "data/compressed_0fa43e.bin"

CompressedData_26:
	.incbin "data/compressed_0faa4e.bin"

CompressedData_27:
	.incbin "data/compressed_0fbac3.bin" READ $453d

.bank $020 slot 3
.org $0

	.incbin "data/compressed_0fbac3.bin" SKIP $453d

CompressedData_28:
	.incbin "data/compressed_100bc2.bin"

CompressedData_29:
	.incbin "data/compressed_101289.bin"

CompressedData_2a:
	.incbin "data/compressed_101500.bin"

CompressedData_2b:
	.incbin "data/compressed_101552.bin"

CompressedData_2c:
	.incbin "data/compressed_1017ed.bin"

CompressedData_2d:
	.incbin "data/compressed_101974.bin"

CompressedData_2e:
	.incbin "data/compressed_101b39.bin"

CompressedData_2f:
	.incbin "data/compressed_101c15.bin"

CompressedData_30:
	.incbin "data/compressed_101daf.bin"

CompressedData_31:
	.incbin "data/compressed_10239f.bin"

CompressedData_32:
	.incbin "data/compressed_10279a.bin"

CompressedData_33:
	.incbin "data/compressed_102aea.bin"

CompressedData_34:
	.incbin "data/compressed_103112.bin"

CompressedData_35:
	.incbin "data/compressed_103522.bin"

CompressedData_36:
	.incbin "data/compressed_1035ba.bin"

CompressedData_37:
	.incbin "data/compressed_10370d.bin" READ $48f3

.bank $021 slot 3
.org $0

	.incbin "data/compressed_10370d.bin" SKIP $48f3

CompressedData_38:
	.incbin "data/compressed_108cd9.bin"

CompressedData_39:
	.incbin "data/compressed_108e0c.bin"

CompressedData_3a:
	.incbin "data/compressed_108f3a.bin"

CompressedData_3b:
	.incbin "data/compressed_10932a.bin"

CompressedData_3c:
	.incbin "data/compressed_109456.bin"

CompressedData_3d:
	.incbin "data/compressed_109666.bin"

CompressedData_3e:
	.incbin "data/compressed_1098a4.bin"

CompressedData_3f:
	.incbin "data/compressed_109f76.bin"

CompressedData_40:
	.incbin "data/compressed_10a1fd.bin"

CompressedData_41:
	.incbin "data/compressed_10a3bf.bin"

CompressedData_42:
	.incbin "data/compressed_10a526.bin"

CompressedData_43:
	.incbin "data/compressed_10bbf5.bin"

CompressedData_44:
	.incbin "data/compressed_10bdc3.bin"

CompressedData_45:
	.incbin "data/compressed_10bea0.bin"

CompressedData_46:
	.incbin "data/compressed_10c022.bin"

CompressedData_47:
	.incbin "data/compressed_10c6c1.bin"

CompressedData_48:
	.incbin "data/compressed_10c87b.bin"

CompressedData_49:
	.incbin "data/compressed_10db3e.bin"

CompressedData_4a:
	.incbin "data/compressed_10dd6e.bin"

CompressedData_4b:
	.incbin "data/compressed_10e23c.bin"

CompressedData_4c:
	.incbin "data/compressed_10e7e4.bin"

CompressedData_4d:
	.incbin "data/compressed_10f84d.bin"

CompressedData_4e:
	.incbin "data/compressed_10f90c.bin" READ $06f4

.bank $022 slot 3
.org $0

	.incbin "data/compressed_10f90c.bin" SKIP $06f4

CompressedData_4f:
	.incbin "data/compressed_1108ba.bin"

CompressedData_50:
	.incbin "data/compressed_110ccf.bin"

CompressedData_51:
	.incbin "data/compressed_111123.bin"

CompressedData_52:
	.incbin "data/compressed_11117f.bin"

CompressedData_53:
	.incbin "data/compressed_1113d4.bin"

CompressedData_54:
	.incbin "data/compressed_11141d.bin"

CompressedData_55:
	.incbin "data/compressed_111e17.bin"

CompressedData_56:
	.incbin "data/compressed_1121f3.bin"

CompressedData_57:
	.incbin "data/compressed_112312.bin"

CompressedData_58:
	.incbin "data/compressed_1129c3.bin"

CompressedData_59:
	.incbin "data/compressed_112cb9.bin"

CompressedData_5a:
	.incbin "data/compressed_114352.bin"

CompressedData_5b:
	.incbin "data/compressed_115755.bin"

CompressedData_5c:
	.incbin "data/compressed_115917.bin"

CompressedData_5d:
	.incbin "data/compressed_11591e.bin"

CompressedData_5e:
	.incbin "data/compressed_115fb9.bin"

CompressedData_5f:
	.incbin "data/compressed_11610e.bin"

CompressedData_60:
	.incbin "data/compressed_1171af.bin"

CompressedData_61:
	.incbin "data/compressed_117aa7.bin"

CompressedData_62:
	.incbin "data/compressed_117c40.bin"

CompressedData_63:
	.incbin "data/compressed_117e41.bin"

CompressedData_64:
	.incbin "data/compressed_117e44.bin" READ $01bc

.bank $023 slot 3
.org $0

	.incbin "data/compressed_117e44.bin" SKIP $01bc

CompressedData_65:
	.incbin "data/compressed_1180aa.bin"

CompressedData_66:
	.incbin "data/compressed_11918b.bin"

CompressedData_67:
	.incbin "data/compressed_1193d1.bin"

CompressedData_68:
	.incbin "data/compressed_11950a.bin"

CompressedData_69:
	.incbin "data/compressed_119552.bin"

CompressedData_6a:
	.incbin "data/compressed_1195a4.bin"

CompressedData_6b:
	.incbin "data/compressed_1198c2.bin"

CompressedData_6c:
	.incbin "data/compressed_1198f8.bin"

CompressedData_6d:
	.incbin "data/compressed_11f72a.bin"

CompressedData_6e:
	.incbin "data/compressed_11f90e.bin" READ $06f2

.bank $024 slot 3
.org $0

	.incbin "data/compressed_11f90e.bin" SKIP $06f2

CompressedData_6f:
	.incbin "data/compressed_1208a2.bin"

CompressedData_70:
	.incbin "data/compressed_120932.bin"

CompressedData_71:
	.incbin "data/compressed_120a67.bin"

CompressedData_72:
	.incbin "data/compressed_120be8.bin"

CompressedData_73:
	.incbin "data/compressed_1218db.bin"

CompressedData_74:
	.incbin "data/compressed_1224a2.bin"

CompressedData_75:
	.incbin "data/compressed_1235d8.bin"

CompressedData_76:
	.incbin "data/compressed_12367f.bin"

CompressedData_77:
	.incbin "data/compressed_123682.bin"

CompressedData_78:
	.incbin "data/compressed_123c48.bin"

CompressedData_79:
	.incbin "data/compressed_123c65.bin" READ $439b

.bank $025 slot 3
.org $0

	.incbin "data/compressed_123c65.bin" SKIP $439b

CompressedData_7a:
	.incbin "data/compressed_128548.bin"

CompressedData_7b:
	.incbin "data/compressed_12c547.bin"

CompressedData_7c:
	.incbin "data/compressed_12ff81.bin" READ $007f

.bank $026 slot 3
.org $0

	.incbin "data/compressed_12ff81.bin" SKIP $007f

CompressedData_7d:
	.incbin "data/compressed_13337a.bin"

CompressedData_7e:
	.incbin "data/compressed_1333cc.bin"

CompressedData_7f:
	.incbin "data/compressed_133402.bin"

CompressedData_80:
	.incbin "data/compressed_1336e1.bin" READ $491f

.bank $027 slot 3
.org $0

	.incbin "data/compressed_1336e1.bin" SKIP $491f

CompressedData_81:
	.incbin "data/compressed_138799.bin"

CompressedData_82:
	.incbin "data/compressed_1399f4.bin"

CompressedData_83:
	.incbin "data/compressed_13afc6.bin"

CompressedData_84:
	.incbin "data/compressed_13b0ee.bin"

CompressedData_85:
	.incbin "data/compressed_13e638.bin"

CompressedData_86:
	.incbin "data/compressed_13e79e.bin"

CompressedData_87:
	.incbin "data/compressed_13e8a2.bin"

CompressedData_88:
	.incbin "data/compressed_13ef30.bin"

CompressedData_89:
	.incbin "data/compressed_13f246.bin"

CompressedData_8a:
	.incbin "data/compressed_13f651.bin"

CompressedData_8b:
	.incbin "data/compressed_13fdc1.bin"

CompressedData_8c:
	.incbin "data/compressed_13fe68.bin"

CompressedData_8d:
	.incbin "data/compressed_13ff64.bin" READ $009c

.bank $028 slot 3
.org $0

	.incbin "data/compressed_13ff64.bin" SKIP $009c

CompressedData_8e:
	.incbin "data/compressed_140448.bin"

CompressedData_8f:
	.incbin "data/compressed_140894.bin"

CompressedData_90:
	.incbin "data/compressed_1409c0.bin"

CompressedData_91:
	.incbin "data/compressed_140a39.bin"

CompressedData_92:
	.incbin "data/compressed_140aa6.bin"

CompressedData_93:
	.incbin "data/compressed_140b18.bin"

CompressedData_94:
	.incbin "data/compressed_140b97.bin"

CompressedData_95:
	.incbin "data/compressed_140d11.bin"

CompressedData_96:
	.incbin "data/compressed_140e97.bin"

CompressedData_97:
	.incbin "data/compressed_140fd5.bin"

CompressedData_98:
	.incbin "data/compressed_141198.bin"

CompressedData_99:
	.incbin "data/compressed_141372.bin"

CompressedData_9a:
	.incbin "data/compressed_1429ee.bin"

CompressedData_9b:
	.incbin "data/compressed_1435b5.bin"

CompressedData_9c:
	.incbin "data/compressed_143630.bin"

CompressedData_9d:
	.incbin "data/compressed_1436a2.bin"

CompressedData_9e:
	.incbin "data/compressed_143718.bin"

CompressedData_9f:
	.incbin "data/compressed_14377c.bin"

CompressedData_a0:
	.incbin "data/compressed_1437ed.bin"

CompressedData_a1:
	.incbin "data/compressed_14385c.bin"

CompressedData_a2:
	.incbin "data/compressed_1438c2.bin"

CompressedData_a3:
	.incbin "data/compressed_143ff4.bin"

CompressedData_a4:
	.incbin "data/compressed_144519.bin"

CompressedData_a5:
	.incbin "data/compressed_1446ab.bin"

CompressedData_a6:
	.incbin "data/compressed_144704.bin"

CompressedData_a7:
	.incbin "data/compressed_144715.bin"

CompressedData_a8:
	.incbin "data/compressed_144ac4.bin"

CompressedData_a9:
	.incbin "data/compressed_144c24.bin"

CompressedData_aa:
	.incbin "data/compressed_145e88.bin"

CompressedData_ab:
	.incbin "data/compressed_14682c.bin"

CompressedData_ac:
	.incbin "data/compressed_146e84.bin"

CompressedData_ad:
	.incbin "data/compressed_147b59.bin" READ $04a7

.bank $029 slot 3
.org $0

	.incbin "data/compressed_147b59.bin" SKIP $04a7

CompressedData_ae:
	.incbin "data/compressed_148a98.bin"

CompressedData_af:
	.incbin "data/compressed_148ccb.bin"

CompressedData_b0:
	.incbin "data/compressed_148d55.bin"

CompressedData_b1:
	.incbin "data/compressed_14a31d.bin"

CompressedData_b2:
	.incbin "data/compressed_14ab68.bin"

CompressedData_b3:
	.incbin "data/compressed_14abda.bin"

CompressedData_b4:
	.incbin "data/compressed_14c399.bin"

CompressedData_b5:
	.incbin "data/compressed_14c3ea.bin"

CompressedData_b6:
	.incbin "data/compressed_14c3ed.bin"

CompressedData_b7:
	.incbin "data/compressed_14c3f0.bin"

CompressedData_b8:
	.incbin "data/compressed_14c3f3.bin"

CompressedData_b9:
	.incbin "data/compressed_14c3f6.bin"

CompressedData_ba:
	.incbin "data/compressed_14c3f9.bin"

CompressedData_bb:
	.incbin "data/compressed_14c3fc.bin"

CompressedData_bc:
	.incbin "data/compressed_14c3ff.bin"

CompressedData_bd:
	.incbin "data/compressed_14c402.bin"

CompressedData_be:
	.incbin "data/compressed_14c48f.bin"

CompressedData_bf:
	.incbin "data/compressed_14c585.bin"

CompressedData_c0:
	.incbin "data/compressed_14c659.bin"

CompressedData_c1:
	.incbin "data/compressed_14c76a.bin"

CompressedData_c2:
	.incbin "data/compressed_14c989.bin"

CompressedData_c3:
	.incbin "data/compressed_14caef.bin"

CompressedData_c4:
	.incbin "data/compressed_14cb37.bin"

CompressedData_c5:
	.incbin "data/compressed_14d1f8.bin"

CompressedData_c6:
	.incbin "data/compressed_14d350.bin"

CompressedData_c7:
	.incbin "data/compressed_14d5bd.bin"

CompressedData_c8:
	.incbin "data/compressed_14e6af.bin"

CompressedData_c9:
	.incbin "data/compressed_14fab8.bin"

CompressedData_ca:
	.incbin "data/compressed_14fabf.bin"

CompressedData_cb:
	.incbin "data/compressed_14fac6.bin"

CompressedData_cc:
	.incbin "data/compressed_14fbb4.bin" READ $044c

.bank $02a slot 3
.org $0

	.incbin "data/compressed_14fbb4.bin" SKIP $044c

CompressedData_cd:
	.incbin "data/compressed_150e88.bin"

CompressedData_ce:
	.incbin "data/compressed_151c53.bin"

CompressedData_cf:
	.incbin "data/compressed_153464.bin"

CompressedData_d0:
	.incbin "data/compressed_154cbc.bin"

CompressedData_d1:
	.incbin "data/compressed_155a49.bin"

CompressedData_d2:
	.incbin "data/compressed_155a50.bin"

CompressedData_d3:
	.incbin "data/compressed_156156.bin"

CompressedData_d4:
	.incbin "data/compressed_15615d.bin"

CompressedData_d5:
	.incbin "data/compressed_156164.bin"

CompressedData_d6:
	.incbin "data/compressed_15728c.bin"

CompressedData_d7:
CompressedData_da:
	.incbin "data/compressed_1574ed.bin"

CompressedData_d8:
CompressedData_db:
	.incbin "data/compressed_157604.bin"

CompressedData_d9:
CompressedData_dc:
	.incbin "data/compressed_157cbf.bin" READ $0341

.bank $02b slot 3
.org $0

	.incbin "data/compressed_157cbf.bin" SKIP $0341
