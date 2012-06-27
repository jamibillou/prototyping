BootstrapPrototyping::Application.routes.draw do

  get 'ajax/switch_mode'
  
  match 'candidate_signup'             => 'shareable#candidate_signup'
  match 'candidate_profile_public'     => 'shareable#candidate_profile_public'
  match 'recruiter_starts_discussion'  => 'shareable#recruiter_starts_discussion'
  match 'candidate_profile_you'        => 'shareable#candidate_profile_you'
  match 'candidate_profile_others'     => 'shareable#candidate_profile_others'
  match 'recruiter_answers_yes'        => 'shareable#recruiter_answers_yes'
  match 'recruiter_answers_no'         => 'shareable#recruiter_answers_no'
  match 'candidate_conversations'      => 'shareable#candidate_conversations'
  match 'candidate_conversations2'     => 'shareable#candidate_conversations2'
  match 'candidate_conversations3'     => 'shareable#candidate_conversations3'
  match 'candidate_conversations4'     => 'shareable#candidate_conversations4'
  match 'candidate_sharings'           => 'shareable#candidate_sharings'
  match 'candidate_sharings2'          => 'shareable#candidate_sharings2'
  match 'candidate_sharings3'          => 'shareable#candidate_sharings3'
  match 'recruiter_profile'            => 'shareable#recruiter_profile'
  match 'candidate_matches'            => 'shareable#candidate_matches'
  match 'candidate_matches2'           => 'shareable#candidate_matches2'
  match 'candidate_matches3'           => 'shareable#candidate_matches3'
  match 'candidate_matches4'           => 'shareable#candidate_matches4'
  match 'recruiter_conversations'      => 'shareable#recruiter_conversations'
  match 'recruiter_conversations2'     => 'shareable#recruiter_conversations2'
  match 'recruiter_conversations3'     => 'shareable#recruiter_conversations3'
  match 'recruiter_conversations4'     => 'shareable#recruiter_conversations4'
  match 'recruiter_sharings'           => 'shareable#recruiter_sharings'
  match 'recruiter_sharings2'          => 'shareable#recruiter_sharings2'
  match 'recruiter_sharings3'          => 'shareable#recruiter_sharings3'

  root :to => 'pages#dashboard'
end
