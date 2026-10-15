import ETSHTS.NoThreeCollinear

/- Kernel dependency exposure of actual theorem declarations. -/
#print axioms ETSHTS.sqDist_self
#print axioms ETSHTS.sqDist_nonneg
#print axioms ETSHTS.sqDist_symm
#print axioms ETSHTS.priority_of_strict_distance
#print axioms ETSHTS.exactlyTwoNearest_of_strict_gap
#print axioms ETSHTS.planeEdges_triangle
#print axioms ETSHTS.planeNearestTwoOrder_triangle
#print axioms ETSHTS.clm0096_card_three
#print axioms ETSHTS.fullEarCertificate_of_card_three
#print axioms ETSHTS.sqDist_ellipsePoint_expand
#print axioms ETSHTS.metricEar_of_strict_gap
#print axioms ETSHTS.clm0108_of_clm0107_and_ratio
#print axioms ETSHTS.sqDist_ellipse_scale
#print axioms ETSHTS.sqDist_ellipse_as_circle_plus
#print axioms ETSHTS.sqDist_ellipse_as_circle_minus
#print axioms ETSHTS.sqDist_ellipse_between_circular_bounds
#print axioms ETSHTS.hasDerivAt_sqDist_ellipse_right
#print axioms ETSHTS.hasDerivAt_sqDist_ellipse_left
#print axioms ETSHTS.deriv_sqDist_ellipse_right
#print axioms ETSHTS.deriv_sqDist_ellipse_left
#print axioms ETSHTS.sqDist_unit_circle_cos_sub
#print axioms ETSHTS.sin_chord_double_half
#print axioms ETSHTS.sin_chord_right_anisotropy
#print axioms ETSHTS.sin_chord_left_anisotropy
#print axioms ETSHTS.deriv_sqDist_ellipse_right_sine
#print axioms ETSHTS.neg_deriv_sqDist_ellipse_left_sine
#print axioms ETSHTS.deriv_sqDist_ellipse_right_factorized
#print axioms ETSHTS.neg_deriv_sqDist_ellipse_left_factorized
#print axioms ETSHTS.ellipse_MD_bounds
#print axioms ETSHTS.positive_MD_bracket
#print axioms ETSHTS.deriv_sqDist_ellipse_right_pos_of_cutoff
#print axioms ETSHTS.neg_deriv_sqDist_ellipse_left_pos_of_cutoff
#print axioms ETSHTS.cos_two_arctan_rational
#print axioms ETSHTS.ellipse_anisotropy_cos_cutoff
#print axioms ETSHTS.ellipse_short_arc_half_bounds
#print axioms ETSHTS.ellipse_short_arc_both_derivatives
#print axioms ETSHTS.sqDist_ellipse_strict_right
#print axioms ETSHTS.sqDist_ellipse_strict_left
#print axioms ETSHTS.sqDist_ellipse_strict_outward
#print axioms ETSHTS.clm0102_exact
#print axioms ETSHTS.cos_two_pi_div_five_exact
#print axioms ETSHTS.sin_two_pi_div_five_lt_49_div_50
#print axioms ETSHTS.ellipse_ratio_101_le_R
#print axioms ETSHTS.clm0108_of_clm0107
#print axioms ETSHTS.four_point_order_from_strict_separation

#check ETSHTS.CLM0096
#check ETSHTS.CLM0099
#check ETSHTS.CLM0102
#check ETSHTS.CLM0107
#check ETSHTS.CLM0108

#print axioms ETSHTS.cartLexLT_trans
#print axioms ETSHTS.cartLexLT_total_of_ne
#print axioms ETSHTS.priority_trans
#print axioms ETSHTS.priority_total_of_ne
#print axioms ETSHTS.exactlyTwoNearest_of_three_rank
#print axioms ETSHTS.exactlyTwoNearest_three_exists
#print axioms ETSHTS.four_point_order_from_exact_nearest
#print axioms ETSHTS.four_point_order_of_all_nearest_pairs_plane

#print axioms ETSHTS.s033_cyclic_min_two_gap_average
#print axioms ETSHTS.s033_distance_reversal
#print axioms ETSHTS.s033_nonadjacent_strictly_closer

#print axioms ETSHTS.s034_rational_denominator_positive
#print axioms ETSHTS.s034_chord_horizontal_numerator
#print axioms ETSHTS.s034_chord_vertical_numerator
#print axioms ETSHTS.s034_homogeneous_chord_square

#print axioms ETSHTS.s035_eligible_exists_from_average
#print axioms ETSHTS.s035_eligible_metric_min_exists
#print axioms ETSHTS.s035_eligible_skip_exceeds_both_neighbours
#print axioms ETSHTS.s035_forward_short_arc_competitor
#print axioms ETSHTS.s035_backward_short_arc_competitor
#print axioms ETSHTS.s035_metric_ear_of_skip_chord_floor

#print axioms ETSHTS.s036_sin_two_pi_div_five_pos
#print axioms ETSHTS.s036_closed_ratio_square
#print axioms ETSHTS.s036_closed_ratio_central_product
#print axioms ETSHTS.s036_closed_ratio_central_floor
#print axioms ETSHTS.s036_skip_witness_le_central_floor

#print axioms ETSHTS.s037_ellipse_boundary_weighted_norm
#print axioms ETSHTS.s037_weighted_sqDist_pos
#print axioms ETSHTS.s037_ellipse_strict_support
#print axioms ETSHTS.s037_ellipse_strictConvexPosition

#print axioms ETSHTS.s038_strictConvexPosition_no_openSegment
#print axioms ETSHTS.s038_ellipse_no_boundary_strictly_between
#print axioms ETSHTS.s038_grow_retains_initial_edges
#print axioms ETSHTS.s038_planeEdges_of_subset
#print axioms ETSHTS.s038_grow_planar_initial_edges
#print axioms ETSHTS.s038_card_three_plane_iff_fullEarCertificate

#print axioms ETSHTS.s039_insert_edges_supported
#print axioms ETSHTS.s039_fresh_insert_two_edges

#print axioms ETSHTS.s040_grow_support_and_exact_count

#print axioms ETSHTS.s041_triangleEdges_card
#print axioms ETSHTS.s041_triangleEdges_supported
#print axioms ETSHTS.s041_planeNearestTwoOrder_exact_edge_count

#print axioms ETSHTS.s041_uniform_metricEar_gives_certificate
#print axioms ETSHTS.s041_ellipse_full_certificate_of_uniform_ears
#print axioms ETSHTS.s041_clm0107_of_clm0099_and_uniform_ears
#print axioms ETSHTS.s041_clm0108_of_clm0099_and_uniform_ears

#print axioms ETSHTS.s041_orientation_zero_affine
#print axioms ETSHTS.s041_affine_parameter_distinct
#print axioms ETSHTS.s041_no_three_exposed_on_affine_line
#print axioms ETSHTS.s041_strictConvexPosition_noThreeCollinear
#print axioms ETSHTS.s041_ellipse_noThreeCollinear
