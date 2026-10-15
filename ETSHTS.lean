import ETSHTS.ConvexFourClassification
import ETSHTS.FiniteEllipsePhase
import ETSHTS.CyclicEllipsePhase
import ETSHTS.CyclicEllipseSkip

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

#print axioms ETSHTS.s041_strictConvexPosition_of_subset
#print axioms ETSHTS.s041_noThreeCollinear_of_subset
#print axioms ETSHTS.s041_hullSide_of_subset
#print axioms ETSHTS.s041_strictConvexPosition_erase

#print axioms ETSHTS.s041_fullEarCertificate_card_ge_three
#print axioms ETSHTS.s041_fullEarCertificate_iff_ear_deletion
#print axioms ETSHTS.s041_certificate_four_has_three_site_remainder

#print axioms ETSHTS.s042_sum_permuted_gap
#print axioms ETSHTS.s042_two_gap_sum
#print axioms ETSHTS.s042_two_gap_sum_full_turn
#print axioms ETSHTS.s042_eligible_metric_min_from_full_turn

#print axioms ETSHTS.s042_orientation_affine_segment
#print axioms ETSHTS.s042_orientation_openSegment_zero
#print axioms ETSHTS.s042_no_properCross_of_same_strict_side
#print axioms ETSHTS.s042_hullSide_safe_against_disjoint_chord

#print axioms ETSHTS.s042_orientation_swap
#print axioms ETSHTS.s042_properCross_swap
#print axioms ETSHTS.s042_hullSide_swap
#print axioms ETSHTS.s042_edge_eq_pair_or_swap
#print axioms ETSHTS.s042_hullSide_edge_transport
#print axioms ETSHTS.s042_planeEdges_insert_hullSide
#print axioms ETSHTS.s042_planeEdges_insert_both_hullSides

#print axioms ETSHTS.s042_grow_append_last
#print axioms ETSHTS.s042_planeOrder_extend_metricEar
#print axioms ETSHTS.s042_fullEarCertificate_implies_planeNearestTwoOrder

#print axioms ETSHTS.s042_planeOrder_of_four_tail_and_ge5_ears
#print axioms ETSHTS.s042_clm0107_of_clm0096_and_ge5_ears
#print axioms ETSHTS.s042_clm0108_of_clm0096_and_ge5_ears

#print axioms ETSHTS.s042_hullSide_present_of_planar_cap
#print axioms ETSHTS.s042_order_saturates_all_hullSides_of_cap

#print axioms ETSHTS.s042_barycentric_orientation
#print axioms ETSHTS.s042_barycentric_spoke_no_cross
#print axioms ETSHTS.s042_barycentric_three_spokes_safe

#print axioms ETSHTS.s042_openSegment_reverse
#print axioms ETSHTS.s042_properCross_reverse_first
#print axioms ETSHTS.s042_properCross_reverse_second
#print axioms ETSHTS.s042_noCross_edge_transport
#print axioms ETSHTS.s042_interior_triangle_all_spokes_plane

#print axioms ETSHTS.s042_exact_interior_four_order

#print axioms ETSHTS.s042_crossing_selector_AC_long
#print axioms ETSHTS.s042_crossing_selector

#print axioms ETSHTS.s042_chordLength_sq
#print axioms ETSHTS.s042_strict_chord_triangle

#print axioms ETSHTS.s042_chord_segment_add
#print axioms ETSHTS.s042_orientation_second_segment_ne
#print axioms ETSHTS.s042_crossing_opposite_path_strict
#print axioms ETSHTS.s042_crossing_diagonals_choose_strict_ear

#print axioms ETSHTS.s042_hullSide_first_of_crossing
#print axioms ETSHTS.s042_four_hullSides_of_crossing

#print axioms ETSHTS.s042_crossing_diagonal_not_hullSide
#print axioms ETSHTS.s042_chordLength_lt_sqDist
#print axioms ETSHTS.s042_metricEar_of_crossing_A
#print axioms ETSHTS.s042_crossing_four_has_metricEar

#print axioms ETSHTS.s042_crossing_four_exact_order

#print axioms ETSHTS.s042_four_barycentric_orientation

#print axioms ETSHTS.s042_one_negative_barycentric_cross

#print axioms ETSHTS.s042_two_negative_barycentric_interior

#print axioms ETSHTS.s042_four_order_positive_first

#print axioms ETSHTS.s042_four_points_exact_from_noncollinear

#print axioms ETSHTS.clm0096_exact

#print axioms ETSHTS.s043_grow_extract_last
#print axioms ETSHTS.s043_grow_last_prefix_planar
#print axioms ETSHTS.s043_grow_last_incident_edges

#print axioms ETSHTS.s043_order_peel_explicit_last
#print axioms ETSHTS.s043_nonempty_list_has_last
#print axioms ETSHTS.s043_planeOrder_has_last_ranked_predecessors

#print axioms ETSHTS.s043_R_lt_11_div_10
#print axioms ETSHTS.s043_closed_ratio_strict_aspect_bound
#print axioms ETSHTS.s043_closed_ratio_minor_axis_floor

#print axioms ETSHTS.s044_closed_ratio_cutoff_exceeds_four_pi_div_five
#print axioms ETSHTS.s044_closed_ratio_metric_min_from_full_turn

#print axioms ETSHTS.s044_clm0099_of_last_pair_cyclic_forcing

#print axioms ETSHTS.s044_forced_last_hull_side
#print axioms ETSHTS.s044_cyclic_last_of_saturation_and_two_sides

#print axioms ETSHTS.s045_ellipsePoint_normalized
#print axioms ETSHTS.s045_boundary_has_normalized_angle
#print axioms ETSHTS.s045_finite_ellipse_phase_cover

#print axioms ETSHTS.s045_finite_ellipse_ordered_index
#print axioms ETSHTS.s045_ordered_index_adjacent_gap_pos

#print axioms ETSHTS.s046_clamped_phase
#print axioms ETSHTS.s046_telescope
#print axioms ETSHTS.s046_clamped_adjacent_gap_pos
#print axioms ETSHTS.s046_wrap_gap_pos
#print axioms ETSHTS.s046_true_full_turn
#print axioms ETSHTS.s046_original_ellipse_cyclic_gaps

#print axioms ETSHTS.s046_cyclic_gap
#print axioms ETSHTS.s046_cyclic_gap_pos
#print axioms ETSHTS.s046_cyclic_gap_full_turn
#print axioms ETSHTS.s046_squared_skip_chord
#print axioms ETSHTS.s046_original_closed_ratio_skip_min
