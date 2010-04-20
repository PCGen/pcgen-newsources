<?xml version="1.0" encoding="UTF-8"?>
<!-- CVS $Revision$ $Author$ $Date$ -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:import href="pathfinder_common.xslt"/>

	<xsl:output indent="yes"/>

	<xsl:template match="character">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--	PAGE DEFINITIONS	-->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Portrait 2 Column"
						page-height="297mm"
						page-width="210mm"
						margin-top="10mm"
						margin-bottom="15mm"
						margin-left="12mm"
						margin-right="6mm">
					<fo:region-body region-name="body" column-count="2" column-gap="2mm" margin-top="10mm" margin-bottom="7mm"/>
					<fo:region-before region-name="header" extent="10mm"/>
					<fo:region-after region-name="footer" extent="7mm"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Portrait Main"
						page-height="297mm"
						page-width="210mm"
						margin-top="10mm"
						margin-bottom="15mm"
						margin-left="12mm"
						margin-right="6mm">
					<fo:region-body region-name="body" margin-bottom="7mm"/>
					<fo:region-after region-name="footer" extent="7mm"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Portrait"
						page-height="297mm"
						page-width="210mm"
						margin-top="10mm"
						margin-bottom="15mm"
						margin-left="12mm"
						margin-right="6mm">
					<fo:region-body region-name="body" margin-top="10mm" margin-bottom="7mm"/>
					<fo:region-before region-name="header" extent="10mm"/>
					<fo:region-after region-name="footer" extent="7mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--
			============================================
			Character Sheet Page 1 - Main Page
			============================================
			-->
			<fo:page-sequence>
				<xsl:attribute name="master-reference">Portrait Main</xsl:attribute>
				<xsl:call-template name="page.footer"/>

				<!--	CHARACTER BODY STARTS HERE !!!	-->
				<fo:flow flow-name="body">
					<!--	CHARACTER HEADER	-->
					<fo:block span="all" space-after.optimum="3pt">
						<xsl:apply-templates select="basics"/>
					</fo:block>
					<fo:block span="all">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="54mm"/>
							<fo:table-column column-width="50mm"/>
							<fo:table-column column-width="86mm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-rows-spanned="2">
										<xsl:apply-templates select="abilities"/>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2">
										<xsl:apply-templates select="." mode="hp_table"/>
										<xsl:apply-templates select="armor_class"/>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<xsl:apply-templates select="initiative"/>
										<xsl:apply-templates select="basics/bab" mode="bab"/>
									</fo:table-cell>
									<fo:table-cell number-rows-spanned="2">
										<xsl:apply-templates select="basics/actionpoints"/>
										<xsl:apply-templates select="basics/luck_rerolls"/>
										<xsl:apply-templates select="basics/faith_points"/>
										<xsl:apply-templates select="basics/hero_points"/>
										<xsl:apply-templates select="basics/inspiration_points"/>
										<xsl:apply-templates select="basics/spin_points"/>
										<xsl:apply-templates select="skills">
											<xsl:with-param name="first_skill" select="0"/>
											<xsl:with-param name="last_skill" select="999"/>
											<xsl:with-param name="column_width" select="'narrow'"/>
										</xsl:apply-templates>
										<xsl:apply-templates select="class_features/bardic_performance"/>
										<xsl:apply-templates select="class_features/channel_energy"/>
										<xsl:apply-templates select="class_features/rage"/>
										<xsl:apply-templates select="class_features/wildshape" />
										<xsl:apply-templates select="class_features/stunning_fist"/>
										<xsl:apply-templates select="class_features/ki_pool"/>
										<xsl:apply-templates select="class_features/layonhands" />
										<xsl:apply-templates select="class_features/knights_challenge"/>
										<xsl:apply-templates select="checklists"/>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2">
										<xsl:apply-templates select="saving_throws"/>
										<xsl:apply-templates select="attack" mode="ranged_melee"/>
										<xsl:apply-templates select="weapons/unarmed"/>
										<xsl:apply-templates select="weapons">
											<xsl:with-param name="first_weapon" select="1"/>
											<xsl:with-param name="last_weapon" select="4"/>
											<xsl:with-param name="column_width" select="'wide'"/>
										</xsl:apply-templates>
										<xsl:apply-templates select="protection"/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<!--
			============================================
			Character Sheet Page 2 - Feats and Abilities
			============================================
			-->
			<fo:page-sequence >
				<xsl:attribute name="master-reference">Portrait 2 Column</xsl:attribute>
				<xsl:call-template name="page.header"/>
				<xsl:call-template name="page.footer"/>
				<fo:flow flow-name="body">
					<fo:block>
						<xsl:apply-templates select="feats"/>
						<xsl:apply-templates select="traits"/>
						<xsl:apply-templates select="skill_tricks"/>
						<xsl:apply-templates select="special_attacks"/>
						<xsl:apply-templates select="special_qualities"/>
						<xsl:apply-templates select="warlock_invocations"/>
<!--	Added for Intelligent Item																	-->
						<xsl:apply-templates select="special_abilities"/>
						<xsl:apply-templates select="intelligent_items"/>
<!--						<xsl:apply-templates select="weapon_proficiencies"/>-->
						<xsl:apply-templates select="domains"/>
						<xsl:apply-templates select="prohibited_schools"/>
						<xsl:apply-templates select="languages"/>
						<xsl:apply-templates select="templates"/>
						<xsl:apply-templates select="companions"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<!--
			==================================
			Character Sheet Page 3 - Equipment
			==================================
			-->
			<fo:page-sequence >
				<xsl:attribute name="master-reference">Portrait 2 Column</xsl:attribute>
				<xsl:call-template name="page.header"/>
				<xsl:call-template name="page.footer"/>
				<fo:flow flow-name="body">
					<fo:block>
						<xsl:apply-templates select="equipment"/>
						<xsl:call-template name="money"/>
						<xsl:apply-templates select="weight_allowance"/>
						<xsl:apply-templates select="misc/magics"/>
						<xsl:apply-templates select="weapons">
							<xsl:with-param name="first_weapon" select="5"/>
							<xsl:with-param name="last_weapon" select="9999"/>
							<xsl:with-param name="column_width" select="'narrow'"/>
						</xsl:apply-templates>
<!--
						<xsl:apply-templates select="skills">
							<xsl:with-param name="first_skill" select="51"/>
							<xsl:with-param name="last_skill" select="9999"/>
							<xsl:with-param name="column_width" select="'wide'"/>
						</xsl:apply-templates>
-->
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<!--
			================================
			Character Sheet Page 4+ - Spells
			================================
			-->
			<xsl:apply-templates select="spells"/>
			<xsl:apply-templates select="basics" mode="bio"/>
			<xsl:apply-templates select="basics/notes" mode="bio"/>

		</fo:root>
	</xsl:template>
</xsl:stylesheet>

